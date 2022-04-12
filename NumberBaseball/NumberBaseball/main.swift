//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var initialComputerInput: Set<Int> = Set<Int>()
var verifiedComputerArray: Array<Int> = Array<Int>()
var verifiedUserArray: Array<Int> = Array<Int>()

var remainingChance = 9
var strikeFlag: Bool = false

func generateRandomNumbersForComputer() {
    while initialComputerInput.count < 3 {
        let number: Int = Int.random(in: 1...9)
        initialComputerInput.insert(number)
    }
    verifiedComputerArray = Array(initialComputerInput)
}

func generateRandomNumbersForUser() {
    var initalUserInput: Set<Int> = Set<Int>()
    while initalUserInput.count < 3 {
        let number: Int = Int.random(in: 1...9)
        initalUserInput.insert(number)
    }
    verifiedUserArray = Array(initalUserInput)
}

func decide() {
    var strikeCount = 0
    var ballCount = 0
    for element in 0...2 {
        if verifiedComputerArray[element] == verifiedUserArray[element] {
            strikeCount += 1
        } else if verifiedUserArray.contains(verifiedComputerArray[element]) {
            ballCount += 1
        }
    }
    
    if strikeCount == 3 {
        print("\(strikeCount) 스트라이크, \(ballCount) 볼 - 사용자 승리!")
        strikeFlag = true
    } else {
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
    }
}

func startGame() {
    generateRandomNumbersForComputer()
    while remainingChance != 0 {
        generateRandomNumbersForUser()
        var result: String = "임의의 수 : "
        for element in 0...2 {
            result += "\(verifiedUserArray[element]) "
        }
        result.removeLast()
        print(result)
        
        decide()
        if strikeFlag {
            break
        }
        
        remainingChance -= 1
        print("남은 기회 : \(remainingChance)")
        if remainingChance == 0 {
            print("컴퓨터 승리...!")
        }
    }
}

startGame()
