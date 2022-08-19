# 숫자야구 프로젝트 저장소
> 프로젝트 기간 2022/08/16 ~ 2022/08/19  
> 팀원: @애종 @LJ / 리뷰어: @바드

# 목차
- [프로젝트 소개](#프로젝트-소개)
- [순서도](#순서도)
    - [Step1](##Step1)
    - [Step2](##Step2)
- [코딩 컨벤션](##코딩-컨벤션)
- [STEP 0](#STEP-0)
   - [고민한 점](#고민한-점)
   - [배운 개념](#배운개념)
- [STEP 1](#STEP-1)
   - [고민한 점](#고민한-점)
   - [배운 개념](#배운개념)



# 프로젝트 소개
1~9까지 수 중 3개의 랜덤 숫자를 뽑아놓고, 사용자의 입력값을 받아 숫자, 순서의 일치여부를 판단해 승리여부를 결정하는 숫자 야구 게임.

# 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.6-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.4-blue)]()

# 순서도 

## Step1
![](https://i.imgur.com/eE0lPEQ.png)

## Step2
![](https://i.imgur.com/Cekbs0w.png)



---

## 코딩 컨벤션
- 변수명 정할 때 단어 축약하지 않기
- 상수로 선언해줄 수 있는 부분은 최대한 상수로 구현
- 전역변수는 최대한 지양
- 타입 명시는 통일
- 함수 내부는 함수명과 함수의 목적에 맞게 구현

# [STEP 0]


## 배운개념
- git commit 명령어, commit양식, git 사용방법


# [STEP 1]

## 고민한 점
- 볼과 스트라이크를 비교하는 과정을 어떻게 설계할까 고민했습니다. 3가지의 경우의 수로 나누어 어떤것부터 제외해 나갈까 고민한 후 최종적으로 ‘순서에 상관없이 숫자를 포함하는 경우’ 를 먼저 guard로 묶은 후 순서의 일치 여부에 따라 볼과 스트라이크를 구분했습니다.
- 실행문과 함수의 배치 -> 변수/상수 선언, 실행문 먼저, 함수는 실행되는 순으로 
- guard else{} statement 에 return을 입력했을 때 함수가 조기 종료되었습니다. 저희가 의도한 것은 반복문 내부의 else{} 에 진입하면 `해당 반복을 중단하고 다음 반복으로 진행`시키는 것이었기 때문에, 공식문서에 따라 continue로 변경했습니다. 
- 무작위 숫자 3개 저장타입을 `Set`와 `Array`중 고민하였습니다. -> 둘 다 사용하였습니다. 첫번째 검증조건인 중복제거에서는 `Set`를, 위치비교에서는 `Array`를 사용하였습니다.  

## 배운개념

- `LGTM`(Looks Good To Me😉)
- 마크다운 작성법



## 🔗 참고 링크
- [Swift ReferenceManual - Guard Statement](https://docs.swift.org/swift-book/ReferenceManual/Statements.html#grammar_guard-statement)
- [Swift ReferenceManual - Return Statement](https://docs.swift.org/swift-book/ReferenceManual/Statements.html#grammar_return-statement)
- [Swift API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/)
- [Developer Apple Documentation - enumerated()](https://developer.apple.com/documentation/swift/array/enumerated())
- [Flow Chart 공식문서](http://www.tcpschool.com/codingmath/flowchart)
