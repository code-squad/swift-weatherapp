# swift-weatherapp
STEP18 날씨 앱 저장소



## 18-1 : UITableViewController

### 화면 이미지
<img src="./img/step01.png" width="200" style="max-width:100%;">

### 핵심 기능

- TableViewController 속성에서 Content 값을 Static Cells로 변경
- 가이드라인에 맞춰서 만듬

### 학습 내용
- Static한 TableView는 TableViewController를 이용하는 경우에만 만들 수 있다. ( 정적 테이블을 사용하기 위해서는 UITableView가 아닌 UITableViewController 안에서 사용해야 한다.)
- TableView 오브젝트를 선택한 뒤, Static Cells를 선택

- 이미지 채우는 contentMode에 대해 학습: [블로그 정리](https://roeldowney.tistory.com/153)

## 어려웠던 점

- DateTimeCell 설정에서 dateLabel, timeLabel 이등분으로 설정할때 set horizontal hugging priority to 200 에러가 났다.

이게 왜 에러가 난지 모르겠다. 일단 이등분으로 하기위해 두개의 Label을 선택하고 width를 동일하게 주었다.



- Failed to instantiate the default view controller for UIMainStoryboardFile 'Main' - perhaps the designated entry point is not set?

: 위의 에러가 난 이유는 처음 스토리보드에서 만들어진 걸 지우고 새로 Table View Controller를 올리고 View Controller에 is Initial View Controller 를 체크가 해제 되어서 에러가 났다.



## 18-2 : DataSource 객체

### 화면 이미지

<img src="./img/step02.png" width="200" style="max-width:100%;">

### 핵심 기능

- JSONSerialization을 활용
- UITableViewDataSource 프로토콜 채택하고 필수 메소드 구현

### 학습 내용

- UITableViewController와 UIViewController에 UITableView를 추가한 차이를 학습
- DataSource 프로토콜을 구현하기 위한 필수 메소드 형식과 동작 방식을 정리
- Delegate 패턴과 DataSource 프로토콜과 비슷한 점, 차이점은 무엇인지 학습

## 어려웠던 점

- JSONSerialization를 활용해서 Holidays를 만들었는데, UITableViewDataSource 추가하는 과정에서 dequeueReusableCell를 제대로 쓸 줄 몰라서 어려웠다.



