//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

var randomValue: [Int] = []
var gameCount = 9

let strike_out = 3

// MARK: - Main Class
class NumberBaseball {
    init() {
        randomValue = createRandom()
    }
    func startGame() {
        while gameCount > 0 {
            printInstruction()
            var inputNumber = readLine()!.split(separator: " ").map { Int(String($0)) ?? -1 }
            if !checkInput(userInput: inputNumber) {
                continue
            }
            inputNumber = checkRepeat(userInput: inputNumber)
            gameCount -= 1
            
            print("임의의 수 : \(inputNumber[0]) \(inputNumber[1]) \(inputNumber[2])")
            let strikeBallResult = checkStrikeOrBall(pitch: inputNumber)
            
            if strikeBallResult[0] == strike_out {
                print("사용자 승리!")
                restartGame()
                return
                
            } else {
                print("\(strikeBallResult[0]) 스트라이크, \(strikeBallResult[1]) 볼")
                print("남은 기회 : \(gameCount)")
            }
        }
        print("컴퓨터 승리...!")
    }
    
    func chooseGame() {
        print("1. 게임시작")
        print("2. 게임 종료")
        print("원하는 기능을 선택해주세요", terminator: ": ")
        
        if let userInput = readLine() {
            switch userInput {
            case "1":
                startGame()
                
            case "2":
                print("게임을 종료합니다")
                
            default:
                print("입력이 잘못되었습니다")
                chooseGame()
            }
        }
    }
    
    func checkRepeat(userInput: [Int]) -> [Int] {
        var nonRepNumbers: [Int] = []
        for index in userInput {
            if nonRepNumbers.contains(index) {
                startGame()
                
            } else {
                nonRepNumbers.append(index)
            }
        }
        return nonRepNumbers
    }
    
    func checkInput(userInput: [Int]) -> Bool {
        if userInput.count == 3 && !userInput.contains(-1) {
            return true
        }
        else {
            printError()
            return false
        }
    }
    
    func printInstruction() {
        print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
        print("중복 숫자는 허용하지 않습니다.")
        print("입력", terminator: ":")
    }
    
    func printError() {
        print("입력이 잘못되었습니다.")
    }
    func restartGame() {
        gameCount = 9
        chooseGame()
    }
}

// MARK: - Extension
extension NumberBaseball {
    
    func createRandom() -> [Int] {
        var randomPitches: [Int] = []
        
        while randomPitches.count != 3 {
            let number = Int.random(in: 1...9)
            
            if randomPitches.contains(number) {
                continue
                
            } else {
                randomPitches.append(number)
            }
        }
        return randomPitches
    }
    
    func checkStrikeOrBall(pitch score: [Int]) -> [Int] {
        var status: [Int] = []
        
        status.append(checkStrike(user: score))
        status.append(checkBall(user: score))
        
        return status
    }
    
    // MARK: - Check State
    func checkStrike(user: [Int]) -> Int {
        var strike = 0
        
        for (computer, pitcher) in zip(randomValue, user) {
            if computer == pitcher {
                strike += 1
            }
        }
        
        return strike
    }
    
    func checkBall(user: [Int]) -> Int {
        var ball = 0
        for index in 0..<randomValue.count {
            if randomValue.contains(user[index]) && (randomValue[index] != user[index]) {
                ball += 1
            }
        }
        return ball
    }
}

// MARK: - Create Instance && Start
let NBGame = NumberBaseball()
NBGame.chooseGame()
