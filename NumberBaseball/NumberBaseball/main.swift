//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let digitsOfGame = 3

let defaultErrorMessage = "입력이 잘못되었습니다"

var randomTargetNums: [Int] = []
var playerNums: [Int] = []

var remainedRounds = 9
var strikeCounts = 0
var ballCounts = 0

//MARK: -전체 게임 및 라운드 초기 세팅
func generateUniqueRandomNums(from start: Int, to end: Int) -> [Int] {
    var uniqueRandomNums: Set<Int> = Set<Int>()
    
    while uniqueRandomNums.count < digitsOfGame {
        let num = Int.random(in: start...end)
        uniqueRandomNums.insert(num)
    }
    
    return Array(uniqueRandomNums)
}

func initGameSetting() {
    randomTargetNums = generateUniqueRandomNums(from: 1, to: 9)
    remainedRounds = 9
}

func initStrikeAndBallCounts() {
    strikeCounts = 0
    ballCounts = 0
}

//MARK: -사용자 입력 및 검증, 생성

func presentInputForm() {
    print("""
    숫자 3개를 띄어쓰기로 구분하여 입력해주세요.
    중복 숫자는 허용하지 않습니다.
    """)
}

func inputPlayerNums() -> String {
    print("입력 : ", terminator: "")
    guard let input = readLine(), !input.isEmpty else {
        return ""
    }
    
    return input
}

func separateInput(input: String) -> [String] {
    return input.components(separatedBy: " ")
}

func hasThreeElements(input: [String]) -> Bool {
    return input.count == digitsOfGame
}

func isComposedWithOnlyNums(input: [String]) -> Bool {
    return input.compactMap { Int($0) }.count == digitsOfGame
}

func isUniqueNums(input: [String]) -> Bool {
    return Set(input).count == digitsOfGame
}

func isWithinRange(input: [String]) -> Bool {
    return input.compactMap { Int($0) }.filter { $0 > 0 && $0 < 10 }.count == digitsOfGame
}

func isValidInput(input: [String]) -> Bool {
    guard hasThreeElements(input: input) else {
        return false
    }
    guard isComposedWithOnlyNums(input: input) else {
        return false
    }
    guard isUniqueNums(input: input) else {
        return false
    }
    guard isWithinRange(input: input) else {
        return false
    }
    
    return true
}

func returnResultOfGeneration(isSuccess: Bool, input: [String]) {
    if isSuccess {
        playerNums = input.compactMap { Int($0) }
    } else {
        print(defaultErrorMessage)
    }
}

func generatePlayerNums() {
    var isValid: Bool
    repeat {
        presentInputForm()
        let inputtedPlayerNums = inputPlayerNums()
        let separatedPlayerNums = separateInput(input: inputtedPlayerNums)
        isValid = isValidInput(input: separatedPlayerNums)
        returnResultOfGeneration(isSuccess: isValid, input: separatedPlayerNums)
    } while !isValid
}

//MARK: -게임 진행

func judgeStrikeAndBall(at: Int) {
    if randomTargetNums[at] == playerNums[at] {
        strikeCounts += 1
    } else if Set(randomTargetNums).contains(playerNums[at]) {
        ballCounts += 1
    }
}

func countStrikeAndBall() {
    for eachNum in 0..<digitsOfGame {
        judgeStrikeAndBall(at: eachNum)
    }
}

func decreaseRemainedRounds() {
    remainedRounds -= 1
}

func presentRoundResult() {
    print("\(strikeCounts) 스트라이크 \(ballCounts) 볼")
    print("남은 기회 : \(remainedRounds)")
}

func presentGameResult() {
    if strikeCounts == digitsOfGame {
        print("사용자 승리!")
    } else if remainedRounds == 0 {
        print("컴퓨터 승리...!")
    }
}

func playGame() {
    initGameSetting()
    
    repeat {
        initStrikeAndBallCounts()
        generatePlayerNums()
        countStrikeAndBall()
        decreaseRemainedRounds()
        presentRoundResult()
    } while remainedRounds > 0 && strikeCounts < digitsOfGame
    
    presentGameResult()
}

//MARK: -메뉴 기능

func presentMenu() {
    print("""
    1. 게임시작
    2. 게임종료
    """)
}

func selectMenu() -> String {
    print("원하는 기능을 선택해주세요 : ", terminator: "")
    let selectedMenu = readLine() ?? ""
    return selectedMenu
}

func operateMenu(menu: String) {
    switch menu {
    case "1":
        playGame()
    case "2":
        break
    default:
        print(defaultErrorMessage)
        break
    }
}

func runBaseballGame() {
    var selectedMenu: String
    
    repeat {
        presentMenu()
        selectedMenu = selectMenu()
        operateMenu(menu: selectedMenu)
    } while selectedMenu != "2"
}

runBaseballGame()
