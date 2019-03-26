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
* **Static Cells** : `TableViewController`를 이용하는 경우에만 만들 수 있다. 여기에 `Static Cell` 모드를 선택한 후 코드로 구현할 경우 적용되지 않는다. 보통 스토리보드로 작업을 하게 된다.



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



**실행화면**

<img src="7.png" height="500px"/>



### Step 2

![sc](./4.png)

![sc](./5.png)

* `UITableView` 의 `Dynamic` Content를 이용하여 TableView를 디자인한다.
* `JSONSerialization` 을 활용하여 JSON 데이터를 SWIFT 데이터 형식으로 변환한다.



**TableView Dynamic**

 이전 단계에서 Static Cells로 Cell들을 미리 만들어 놓았던 것과 다르게 Dynamic에서는 `ReuseQueue`를 활용하여 필요할 경우에만 Cell을 생성하여 쓰고 아닌 경우에는 `ReuseQueue` 에서 꺼내쓴다. 

 이렇게 동작하기 위해 세팅해줘야하는 몇가지 사항들이 있다.



1. 스토리보드에 UITableViewController가 아닌 UIViewController를 생성해준다.

2. UIViewController에 화면에 꽉차게 UITableView를 생성해준다.
3. `UITableView`를 `IBOutlet`으로 연결해준다.

```swift
class ViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
}
```

4. ViewController 객체를 `UITableView` `DataSource` 로 등록해준다. 그러기 위해서 ViewController가 `UITableViewDataSource`프로토콜을 채택하여야 한다.

```swift
class ViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(UITableViewCell(), forCellReuseIdentifier: "reuseQueue")
  }
}

extension ViewController: UITableViewDataSource {
  // 테이블 뷰의 섹션수를 리턴
  func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
  
  // 한 섹션당 들어갈 로우의 수를 정해준다
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
    
  // 셀을 큐에서 필요할 경우 가져오고 없을 경우 새로 생성해준다. 그 후 셀을 설정한 후 테이블 뷰에 리턴
  // **큐의 identifier가 꼭 필요하다**
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "reuseQueue", for: indexPath)
    // 이렇게 큐에서 셀을 빼올 경우는 꼭 tableView에 cell을 등록해주어야 한다.

    cell.textLabel?.text = "\(indexPath.section), \(indexPath.row)"
    return cell
  }
}
```

 만약 register를 등록하지 않고 사용할 경우 밑과 같이 해주면 된다.

```swift
// 이렇게 등록할 경우 Cell의 스타일을 정할 수 있다.
let cell: UITableViewCell
if let reuseCell = tableView.dequeueReusableCell(withIdentifier: "reuseQueue") {
  cell = reuseCell 
} else {
  cell = UITableViewCell(style: .subtitle, reuseIdentifier: "reuseQueue") 
}
```



5. `DataSource`를 `TableView`에 연결시켜준다.

```swift
class ViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
  }
}

extension ViewController: UITableViewDataSource { }

```





**JSON Serialization**

 JSON 데이터를 파싱할 수 있는 방법들이 있지만 이번 스텝에서는 JSONSerialization 객체를 이용해보았다.

```swift
let json = """
                    [{\"date\":\"1월1일\", \"subtitle\":\"신정\"},
                    {\"date\":\"2월16일\", \"subtitle\":\"구정\"},
                    {\"date\":\"3월1일\", \"subtitle\":\"삼일절\"},
                    {\"date\":\"5월5일\", \"subtitle\":\"어린이날\"},
                    {\"date\":\"5월22일\", \"subtitle\":\"석가탄신일\"},
                    {\"date\":\"6월6일\", \"subtitle\":\"현충일\"},
                    {\"date\":\"8월15일\", \"subtitle\":\"광복절\"},
                    {\"date\":\"9월24일\", \"subtitle\":\"추석\"},
                    {\"date\":\"10월3일\", \"subtitle\":\"개천절\"},
                    {\"date\":\"10월9일\", \"subtitle\":\"한글날\"},
                    {\"date\":\"12월25일\", \"subtitle\":\"성탄절\"}]
                    """
        
let jsonData: Data? = json.data(using: .utf8)
guard let data = jsonData else { return }
guard let convertedData = try? JSONSerialization.jsonObject(with: data, options: []) as? [Dictionary<String, String>] else { return }
```





**실행화면**

<img src="6.png" height="500px"/>

