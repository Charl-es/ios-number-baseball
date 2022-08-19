## iOS 커리어 스타터 캠프

# 0주차 (숫자게임)

# **숫자게임(base-ball-game)**

---

### 1. **소개:**

**0~9 숫자 중 컴퓨터가 지정한 세개의 값이있고 사용자가 세 개의 값을 여러 번 입력하며 컴퓨터가 지정한 세개의 숫자와 위치를 알아가는 게임 코드입니다.**

**게임진행방법:**

**9라운드로 진행되며 사용자가 세 개의 값을 입력했을 시 컴퓨터의 값과 비교하여 위치와 값이 정확히 같을 시 
1 Strike, 위치는 다르지만 같은 값이 다른 위치에 있으면 1 ball 입니다.
9번의 기회 안에 3 Strike를 달성하면 사용자가 승리하는 게임입니다.**

---

### 2**. 🧑‍🤝‍🧑 팀원**

![**ash**](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/f0c0512f-457b-49a6-9b6d-90145f971f4a/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2022-08-19_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_3.55.22.png)

**ash**

![**sunny**](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/2bea055a-4e45-4e67-859b-fd9bdd817497/KakaoTalk_Photo_2022-08-14-12-55-24.png)

**sunny**

---

### 3**. ✏️ 프로젝트 구조(다이어그램 등)**

![number-baseball-flowchart.svg](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/1841f3f4-9066-48ae-aa6a-f9678f99d102/number-baseball-flowchart.svg)

---

### 4**. 👩🏻‍💻실행 화면(기능 설명)**

- 실행화면에서 **2.게임종료** 선택시
    
    ![스크린샷 2022-08-19 오후 4.15.43.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/a8d6eb60-6e83-4ff2-a66a-a6761522d9b5/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2022-08-19_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_4.15.43.png)
    

- 실행화면에서 **1.게임시작** 선택 후 게임 진행
    
    ![스크린샷 2022-08-19 오후 4.32.45.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/3d2e38ca-0610-4c5b-9880-5ed96a30a190/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2022-08-19_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_4.32.45.png)
    

- 사용자의 입력 오류 처리
    
    ![스크린샷 2022-08-19 오후 4.20.11.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/d43ffa12-ba78-4a69-980b-c403ae896af5/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2022-08-19_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_4.20.11.png)
    

---

### 6**. 🔥 트러블 슈팅**

- 1️⃣  **함수 분리, 배열 및 호출 순서에 대한 고민 (진행 중)**

순서도에 기반해 순차대로 함수를 호출했다고 생각했는데, 결과적으로 요구사항대로 기능이 구현되지 않았던 문제가 있습니다. 현재진행형인 문제이기에 함수 분리 및 프로그램 작동 순서에 대해 조금 더 고민하고 있습니다.

**- 2️⃣ 유저에게 입력받는 배열과 컴퓨터의 임의 숫자를 가지는 배열에 대한 타입 고민:** 

컬렉션 타입으로 Array와 Set 사이에서 고민했습니다. step0부터 step2까지 여러번의 리팩토링 하며 고민했던 문제입니다. 

Set을 이용해 중복없이 컴퓨터의 임의 숫자를 `threeComputerRandomNumbers` 배열에 담는 것까지는 수월했으나, `threeUserRandomNumbers`는 Array타입으로 정의해 Array와 순서가 없는 Set 두 컬렉션의 인덱스와 값을 비교해야하는 문제가 발생했었습니다.

-> 💡해결법: 
`enumerated()`를 이용해 Set과 Array 모두 (index, value) 형태로 값을 추출해 Set과 Array를 비교하는데에는 성공했습니다. 하지만 두가지 배열을 다른 타입으로 사용하면서 코드의 통일성을 고려했을 때 좋지 않다고 판단하여 `threeComputerRandomNumbers`배열 역시 Array 타입으로 수정해 코드를 리팩토링했습니다. 멤버의 중복없이 3개의 멤버를 담는 과정은 별도의 코드를 작성했습니다.

**- 3️⃣ Array에 담긴 값을 어떻게 대괄호( [ ] ) 없이 출력할 수 있을지에 대한 고민**

-> 💡해결법: 
step1에서 유저의 입력을 별도로 받지 않기 때문에 “임의의 수 : 1 2 3” 의 형식으로 콘솔창에 Array 멤버를 출력해야 했습니다.

- 첫번째 방법 : Int타입 Array의 값을 for문으로 하나씩 출력하는 방법
- 두번째 방법 : 멤버들을 `map` 고차함수를 이용해 String 타입으로 변환 후, 이를 [String] 타입에서 이용이 가능한 `joined()` 메서드를 이용하는방법

두번째 방법을 이용해 출력하였습니다.

```swift
print("임의의 수 : \(randomThreeNumbers.map { String($0) }.joined(separator: " "))")
```

---

### 7**. 🔗 참고 링크**

- [Swift API Design Guidelines](https://swift.org/documentation/api-design-guidelines/)
- [Swift Language Guide - Optionals, nil, Optional Binding](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)
- [Swift Language Guide - Collection Types](https://docs.swift.org/swift-book/LanguageGuide/CollectionTypes.html)
- [git book](https://git-scm.com/book/en/v2) (add, commit, pull, push, github)
- [누구나 쉽게 이해할 수 있는 Git 입문](https://backlog.com/git-tutorial/kr/intro/intro1_1.html)
