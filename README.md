# swift-weatherapp
### Step 1

![screen](./1.png)

![screen](./2.png)

* UITableViewController를 이용해 Static Cell을 디자인한다.
* Date() 타입을 사용한다.





**UITableViewController**

 이번 단계에서는 UITableView의 `Static Cell` 를 이용하여 TableView를 디자인해보았다.

 우선 TableView를 선택하고 다음 그림과 같이 Dynamic, Static Cells 중 Static Cell을 선택하여 준다.

![screen](./3.png)



* **Dynamic** : 말 그대로 동적인 테이블 뷰 구현방식이다. 보통 테이블 뷰의 요청에 응답하는 방식으로 표현된다. 코드로 구현한다 보통 DataSource, Delegate 등을 상속받아 구현한다.
* **Static Cells** : `TableViewController`를 이용하는 경우에만 만들 수 있다. 여기에 `Static Cell` 모드를 선택한 후 코드로 구현할 경우 적용되지 않는다.



 이번 단계에서는 보통 `MainStoryBoard`를 활용하여 구현하였다.



**Date타입**

 Date타입 활용하여 현재 시간과 날짜 가져오기를 해보았다.

```swift
/// 날짜 출력
let today: Date = Date()
let dateFormatter: DateFormatter = DateFormatter()

dateFormatter.locale = Locale(identifier: "ko_kr") // 한국 시간으로 지정
dateFormatter.dateFormat = "yyyy년 MM월 dd일"        // 형식 지정
let stringDate = dateFormatter.string(from: today) // String 타입으로 변환
print(stringDate) 						// 2019년 3월 29일

/// 시간 출력
dateFormatter.dateFormat = "a hh시 mm분"
let stringTime = dateFormatter.string(from: today) // 형식 지정
print(stringTime)							// 오후 4시 50분

// a 태그는 오전 오후 표시
// hh시는 2자리로 표시하는데 한자리일 경우 0을 채움
// HH시는 24시간 단위로 표현
// mm분은 현재 분을 표시
```



