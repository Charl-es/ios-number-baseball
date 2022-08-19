//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

choiceMenu()

enum Namespace {
    case trial
    
    var number: Int {
        switch self {
        case .trial:
            return 9
        }
    }
}

func createThreeRandomNumbers() -> [Int] {
    var result: Set<Int> = Set<Int>()
    
    while result.count < 3 {
        result.insert(Int.random(in: 1...9))
    }
    
    return Array(result)
}

func determineStrikesBallsInTwoNumbers(_ computerNumbers: [Int], _ userNumbers: [Int]) -> (strike: Int, ball: Int) {
    var ball: Int = 0
    var strike: Int = 0
    
    for userNumber in userNumbers {
        if computerNumbers.contains(userNumber) {
            ball += 1
        }
    }
    
    for index in 0...2 {
        if userNumbers[index] == computerNumbers[index] {
            strike += 1
        }
    }
    
    ball -= strike
    print("\(strike) 스트라이크, \(ball) 볼")
    return (strike: strike, ball: ball)
}

func isWin(strike: Int, trialNumber: Int) -> Bool {
    if strike == 3 {
        print("사용자 승리")
        return true
    } else if trialNumber == 0 {
        print("컴퓨터 승리")
        return true
    } else {
        print("남은 기회 : \(trialNumber)")
        return false
    }
}

func receiveMenuNumber() -> Int? {
    print("1. 게임시작\n2. 게임종료\n원하는 기능을 선택해주세요 : ", terminator: "")
    if let selectedMenu = Int(readLine() ?? "") {
        return selectedMenu
    } else {
        print("입력이 잘못되었습니다.")
        return nil
    }
}

func receiveUserNumbers() -> [Int]? {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.\n중복 숫자는 허용하지 않습니다.\n입력 : ", terminator: "")
    if let choicedNumber = readLine() {
        return choicedNumber.components(separatedBy: " ").compactMap { Int($0) }
    } else {
        print("입력이 잘못되었습니다.")
        return nil
    }
}

func isCorrectMenuNumber(_ menuNumber: Int) -> Bool {
    if menuNumber == 1 || menuNumber == 2 {
        return true
    } else {
        print("입력이 잘못되었습니다.")
        return false
    }
}

func isCorrectUserNumbers(_ inputedNumbers: [Int]) -> Bool {
    if Set(inputedNumbers).filter({ $0 >= 1 && $0 <= 9 }).count == 3 {
        return true
    } else {
        print("입력이 잘못되었습니다.")
        return false
    }
}

func playNumberBaseballGame() {
    var trialNumber = Namespace.trial.number
    let computerNumbers = createThreeRandomNumbers()
    while trialNumber > 0 {
        guard let userNumbers = receiveUserNumbers(), isCorrectUserNumbers(userNumbers) else {
            continue
        }
        trialNumber -= 1
        let result = determineStrikesBallsInTwoNumbers(computerNumbers, userNumbers)
        
        if isWin(strike: result.strike, trialNumber: trialNumber) {
            break
        }
    }
}

func choiceMenu() {
    while true {
        guard let menuNumber = receiveMenuNumber(), isCorrectMenuNumber(menuNumber) else {
            continue
        }
        
        if menuNumber == 1 {
            playNumberBaseballGame()
        } else if menuNumber == 2 {
            break
        }
    }
}
