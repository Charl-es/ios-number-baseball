//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

var randomSet: Set<Int>
var count: Int = 9

func insertRandomNumber() -> Set<Int> {
    
    var randomSet: Set<Int> = []
    
    while randomSet.count != 3 {
        randomSet.insert(Int.random(in: 1...9))
    }
    
    return randomSet
}

randomSet = insertRandomNumber()

var strike: Int = 0
var ball: Int = 0

var inputArray: Set<Int> = []
var userNumber: Array<Int?> = []

func numberBaseball() {
    let userNumber = readLine()?.split(separator: " ").map {Int($0) ?? 0}
    if let unwrappedUserNumber: Array<Int> = userNumber {
        inputArray = Set(unwrappedUserNumber)
    }
}

