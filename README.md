## iOS 커리어 스타터 캠프

### 숫자야구 프로젝트 저장소


## 목차
1. [제목](#1-제목)
2. [소개](#2-소개)
3. [팀원](#3-팀원)
4. [타임라인](#4-타임라인)
5. [순서도](#5-순서도)
6. [실행화면(기능 설명)](#6-실행화면기능-설명)
7. [트러블 슈팅](#7-트러블-슈팅)
8. [참고 링크](#8-참고-링크)
9. [팀 회고](#9-팀-회고)

## 1. 제목
#### **숫자야구⚽️**

## 2. 소개
> 1부터 9까지의 세 개의 숫자를 입력받아 임의의 컴퓨터 세 개의 수와 비교하여
>> 볼, 스트라이크를 판정하여 3스트라이크가 되면 사용자가 승리하고,
>>> 그 이외의 경우 남은기회가 차감이 되어 0이되면 컴퓨터가 승리하는 게임.

## 3. 팀원
|**uemu**|**Charles**|
|-----|-----|
<img src="https://github.com/Charl-es/ios-number-baseball/assets/124643367/0d2df2a8-e807-445a-8235-a6116f0b7e53" width="200px" height="200px">|<img src="https://github.com/Charl-es/ios-number-baseball/assets/124643367/ce8f78b2-8bc1-480f-af14-08d92d490514" width="200px" height="200px">


## 4. 타임라인
**2023.08.28**
- 순서도 작성

**2023.08.29**
- 전역변수 2개 생성
- 랜덤 정수를 생성하는 함수 구현
- `randomComputerNumbers`의 초기화값 변경
- 정수들을 비교하여 볼 스트라이크 결과를 반환하는 함수 구현
- 게임시작 함수 추가

**2023.08.30**
- 리뷰어의 피드백에 따른 함수의 기능 분리
- 사용자 메뉴를 출력하고 입력받는 함수와 게임 숫자를 입력받는 함수 구현
- 유효성 검증 함수 구현

**2023.08.31**
- 시도 횟수 수정 및 유효성 함수 수정

**20203.09.01**
- 리뷰어의 피드백에 따른`conductMenu` 네이밍 변경, `isRunning` 변수 추가, 컨벤션 통일, 코드 간결화
- 리뷰어의 피드백에 따른 조건문 개행 수정

## 5. 순서도
<img src="https://github.com/Charl-es/ios-number-baseball/assets/124643367/ba8901bc-56f5-4391-90be-9800e64bd17b" width="400px" height="600px">

## 6. 실행화면(기능 설명)
- 메뉴 선택

|1 입력| 
| :--------: |
|<img width="356" alt="1입력" src="https://github.com/Charl-es/ios-number-baseball/assets/124643367/462f11d2-c359-42c5-bfc8-47ce22afbb67"> |
|**2 입력**| 
|<img width="334" alt="2입력" src="https://github.com/Charl-es/ios-number-baseball/assets/124643367/4fa98536-d1dd-4d50-a768-5e592aca2823">|

- 게임 실행 및 결과

|사용자 승리| 
| :--------: |
|<img width="349" alt="사용자 승리시" src="https://github.com/Charl-es/ios-number-baseball/assets/124643367/0489859b-1acb-4044-9dcd-f8f592b7b9bc">|
|**컴퓨터 승리**| 
|<img width="359" alt="컴퓨터 승리시" src="https://github.com/Charl-es/ios-number-baseball/assets/124643367/b2cf755e-6772-42a2-8ee5-fa5d537cfa26">|

## 7. 트러블 슈팅
### 1️⃣함수의 기능 분리
<details>
<summary>코드</summary>
  
**수정 전**
```swift
func compareNumbersAndReturnResult() -> [Int] {
    let userNumbers = generateRandomNumbers()
    var ballAndStrikeCount: [Int] = []

    var ballCount = 0
    var strikeCount = 0

    for index in 0...2 {
        if userNumbers[index] == randomComputerNumbers[index] {
            strikeCount += 1
            ballCount -= 1
        }

        if userNumbers.contains(randomComputerNumbers[index]) {
            ballCount += 1
        }
    }

    ballAndStrikeCount.append(ballCount)
    ballAndStrikeCount.append(strikeCount)

    return ballAndStrikeCount
}
```

**수정 후**
```swift
func calculateBallCount(userNumbers: [Int]) -> Int {
    var ballCount = 0
    
    for index in 0...2 {
        if userNumbers.contains(randomComputerNumbers[index]), userNumbers[index] != randomComputerNumbers[index] {
            ballCount += 1
        }
    }
    
    return ballCount
}

func calculateStrikeCount(userNumbers: [Int]) -> Int {
    var strikeCount = 0
    
    for index in 0...2 {
        if userNumbers[index] == randomComputerNumbers[index] {
            strikeCount += 1
        }
    }
    
    return strikeCount
}
```

</details>

### 2️⃣`while`문의 조건을 담는 지역변수 선언
<details>
<summary>코드</summary>

**수정 전**
```swift
func playGame() {
    while remainsChance > 0 {
        userNumbers = generateRandomNumbers()
        
        print("임의의 수 : \(userNumbers[0]) \(userNumbers[1]) \(userNumbers[2])")
        print("\(calculateStrikeCount(userNumbers: userNumbers)) 스트라이크, \(calculateBallCount(userNumbers: userNumbers)) 볼")
        
        if calculateStrikeCount(userNumbers: userNumbers) == 3 {
            print("사용자 승리!")
            break
        } else {
            remainsChance -= 1
        }
        
        if remainsChance == 0 {
            print("컴퓨터 승리...!")
            break
        }

        print("남은 기회 : \(remainsChance) ")
    }
}
```

**수정 후**
```swift
func inputGameNumbers() {
    var isRunning = true
    
    while isRunning {
        print("""
              숫자 3개를 띄어쓰기로 구분하여 입력해주세요.
              중복 숫자는 허용하지 않습니다.
              입력 :
              """, terminator: " ")
        
        guard let userInputNumbers = readLine() else { continue }
        
        validateInput(userInput: userInputNumbers)
        
        guard userNumbers.count != 3 else {
            isRunning = false
            continue
        }
    }
}
```
  
</details>

## 8. 참고 링크
- ![compactMap 고차함수(Ellie Kim 블로그)](https://hyerios.tistory.com/83)
- ![compactMap 공식문서](https://developer.apple.com/documentation/swift/sequence/compactmap(_:))

## 9. 팀 회고
**😁 우리팀이 잘한점**
- 서로가 트러블 없이 프로젝트를 잘 진행했습니다.
- 프로젝트 기간동안 시간약속을 잘 지키고 성실하게 임했습니다.

**😅 우리팀이 개선할 점**
- 짝 프로그래밍의 규칙을 완벽하게 지키지 못했습니다.









