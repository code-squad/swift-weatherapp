# swift-weatherapp


## STEP1

<img width="398" alt="스크린샷 2019-11-19 오전 11 20 09" src="https://user-images.githubusercontent.com/39197978/69110609-99e1d680-0abe-11ea-86f8-cd2237bff96c.png">



#### 진행 🏃‍♀️

`SnapKit`과 `Then`의 사용법을 익히고

셀의 설정들을 코드로 작성하는 연습을 했다.

코드로 수기로 작성하니, UIComponent를 addSubView() 하는 것을 순간 잊고있었다.

그 상태에서 오토레이아웃을 superView와의 관계설정을 하는 실수가 있었고, 이를 해결했다.



#### 피드백 🧐

- ```
  fatalError() 가 코드에 있는 것은 권장하지 않습니다. 셀이 생성되지 않더라도 앱이 죽기 보다는 표시되지 않더라도 앱이 죽지 않는 게 어떨까요?
  ```

  - 앱이 죽지 않게 변경 후 debug에서 확인할 수 있는 assert를 구현하였다.

---

<br>

## STEP2

<img width="400" alt="스크린샷 2019-11-19 오후 4 54 00" src="https://user-images.githubusercontent.com/39197978/69127205-358a3b80-0aed-11ea-849b-00707b6053b5.png">

#### 진행 🏃‍♂️

json파일을 에서 string을 읽어온 뒤

JSONSerialize로  Parsing을 하는 로직을 구현했다.

또 Cell의 init을 오버라이드하여, cell의 Cell.Style을 코드로 구현하는 것 또한 진행해보았다.