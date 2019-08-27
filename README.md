# swift-weatherapp
STEP18 날씨 앱 저장소



## STEP 1



### 결과화면



<img src="./images/step1/result.png" width=300px>



- TableViewController를 새로 만들지 않고, 기존 UIViewController 내에 TableView를 만들어서 쓴다면, Attributes Inspector에서 Table View의 Contents를 `Static Cells` 로 설정할 때,  xcode 스토리보드 상에서 에러가 발생합니다.
- 하나의 테이블 뷰 섹션에 2개의 셀이 드러가므로 커스텀 테이블뷰 컨트롤러인 `WeatherViewController` 는 아래와 같이 수정해줘야 시뮬레이터 상에서 정상적으로 스토리보드의 커스터마이징 화면이 뜹니다.

```swift
override func numberOfSections(in tableView: UITableView) -> Int {
		// #warning Incomplete implementation, return the number of sections
		return 1
}
override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// #warning Incomplete implementation, return the number of rows
		return 2
}
```

