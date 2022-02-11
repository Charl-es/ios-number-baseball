//
//  NumberBaseball.swift
//  NumberBaseball
//
//  Created by mmim on 2022/02/11.
//

import Foundation

var computerNumbers: [Int] = []
var playerNumbers: [Int] = []
var roundCount: Int = 9
var strike: Int = 0
var ball: Int = 0
let maxNumberCount: Int = 3
let range = 1...9

func startGame() {
    computerNumbers = notOverlapNumbersArray()
    while roundCount > 0 {
        inputPlayerNumbers()
        checkGameResult()
    }
}

func notOverlapNumbersArray() -> [Int] {
    return Array(saveNumbersToSet())
}

func saveNumbersToSet() -> Set<Int> {
    var randomNumbersSet: Set<Int> = []
    while randomNumbersSet.count < maxNumberCount {
        randomNumbersSet.insert(generateRandomNumber())
    }
    return randomNumbersSet
}

func generateRandomNumber() -> Int {
    return Int.random(in: range)
}

func inputPlayerNumbers() {
    printInputNotice()
    guard let inputNumbersString = readLine()?.components(separatedBy: " ") else { return }
    let inputNumbersInt = convertStringToInt(inputNumbersString)
    verifyInputPlayerNumbers(inputNumbersInt)
}

func convertStringToInt(_ inputNumbersString: [String]) -> [Int] {
    return inputNumbersString.compactMap{ Int($0) }
}

func verifyInputPlayerNumbers(_ inputNumbersInt: [Int]) {
    if inputNumbersInt.count == maxNumberCount {
        playerNumbers = inputNumbersInt
        checkScoreCondition()
    } else {
        printErrorNotice()
        inputPlayerNumbers()
    }
}

func printInputNotice() {
    print("🪧숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
    print("🪧중복 숫자는 허용하지 않습니다.")
    print("입력 : ", terminator: "")
}

func printErrorNotice() {
    print("입력이 잘못되었습니다.😜")
}

func checkScoreCondition() {
    let sameNumbers = computerNumbers.filter{ playerNumbers.contains($0) }
    for eachNumber in 0..<maxNumberCount {
        checkStrikeCondition(numberInArray: eachNumber)
    }
    checkBallCondition(sameNumbers: sameNumbers.count)
    printPlayerNumbers()
    printScoreInformation()
}

func checkStrikeCondition(numberInArray: Int) {
    if computerNumbers[numberInArray] == playerNumbers[numberInArray] {
        strike += 1
    }
}

func checkBallCondition(sameNumbers: Int) {
    ball = sameNumbers - strike
}

func printPlayerNumbers() {
    print("\n임의의 수 : ", terminator: "")
    playerNumbers.forEach{ print($0, terminator: " ") }
}

func printScoreInformation() {
    print("\n\(strike) 스트라이크, \(ball) 볼")
    roundCount -= 1
    print("남은 기회 : \(roundCount)")
}

func checkGameResult() {
    strike = 0
    ball = 0
    if roundCount == 0 {
        print("컴퓨터 승리🤣")
    } else if strike == 3 {
        print("유저 승리❤️")
        roundCount = 0
    }
}

