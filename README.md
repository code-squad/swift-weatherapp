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



- [ContentMode 학습 정리](./step1/ImageViewContentMode.md)








## STEP 2



### 결과화면

<img src="./images/step2/result.png" width="300px">



### 학습정리

- [학습정리내용](./step2/studies_TableViewController_TableView_DataSource.md)









## STEP 3

### 

### 결과화면



<img src="./images/step3/result.png" width="300px">





### 개선 후 결과화면 

<img src = "./images/step3/result-errorHandle.gif" width="300px">

- 초기에 잘못된 경로의 주소로 데이터 로드를 시도하고, 예외 처리과정에서 재시도 시 다시 데이터를 읽어오는 과정 추가.



-----



### 학습거리

- 테이블뷰에서 자동으로 결정하는게 아니라 **강제로 셀 높이를 지정**하는 방법

  - 스토리보드의 Size Inspector에서 Table View Cell의 Row Height를 지정하거나, 
  - 코드 프로그래밍 시에는 tableView의 Cell 컨텐츠를 입히는 **func** **tableView**( _ **tableView**: UITableView, cellForRowAt **indexPath**: IndexPath) -> UITableViewCell  등에서 `tableView.rowHeight` 를 고정값으로 지정하면 됩니다.

- **셀 id별로 재사용하는 방식**

  - tableView의 `dequeueReusableCell` 메서드를 활용하여 `withIdentifier:` 값으로 TableViewCell의 Identifier를 집어넣으면 테이블 뷰 렌더링 과정에서 해당 셀을 재사용하는 것이 가능합니다. 
  - 스토리보드에서 셀의 Id값을 지정하였다면 <u>Attribute Inspector의 **Identifier**</u> 에서 설정 및 확인 가능합니다. 

- **재 사용시 유의사항**

  - 값을 선택적으로 받는 경우가 존재한다면 셀의 기존 설정값을 지우고 다시 그리는 작업이 필요합니다. 

  - ex) `cell.backgroundView?.clearsContextBeforeDrawing = true` 처럼 기존에 제공되는 api를 통해 새로 그리기 전에 컨텍스트를 비우거나, 값의 유무가 존재하는 데이터에 대해서는 값을 비워줘야 합니다.

  - 혹은 커스텀 셀에 대해 다음과 같이 **prepareForReuse** 메서드를 오버라이드 취하여 잔존값을 비워야 안전하게 재사용가능합니다.

    ```swift
    class HolidayTableViewCell: UITableViewCell {
        @IBOutlet weak var dateLabel: UILabel!
        @IBOutlet weak var subtitleLabel: UILabel!
        override func prepareForReuse() {
            super.prepareForReuse()
            dateLabel.text = nil
            subtitleLabel.text = nil
            self.backgroundView = nil
        }
    }
    ```

    

- **커스텀 셀 사용시 주의사항**
  - 반드시 재사용가능한 셀을 담은 큐에 그것이 존재하는지 묻는 과정에서 `unwrapping` 과 ` type casting`이 필요합니다. 
  - cell의 identifier와 cell 클래스 명은 다를 수 있습니다. 
  - 서로 다른 커스텀 셀을 한 테이블의 한 섹션에 나타내기 위해서는 prototype cells의 개수를 조정해야 합니다.



-----



### 개발 모드에서 http 통신을 위한 설정 방식

- App Transport Security Policy(a.k.a ATS Policy ; 응용프로그램과 웹 서비스간의 안전한 연결을 위한 정책)에 의해 iOS는 기본적으로 URL을 통해 https가 아닌 http 프로토콜에 직접적으로 통신하는 것을 금지하고 있습니다.

- 개발 과정에서 부득이하게 테스트해야할 때, Info.plist를 수정하여 이를 느슨하게 만들 수 있습니다.

- NSAppTransportSecurity 에서 **`NSAllowsArbitraryLoads`** 를 통해 **1) 전체 HTTP 를 허용하는 방법**과 

- **`NSExceptionDomains`** 를 설정하여 2) **특정 도메인에 대해서만 허용하는 방법**이 존재합니다.

  NSAppTransportSecurity (Dictionary)

  - NSExceptionDomains (Dictionary)

    - NSAllowsArbitraryLoads (Bool)

    - <domain-name-for-exception-as-string> (Dictionary)

    - - NSExceptionMinimumTLSVersion (String)
      - NSExceptionRequiresForwardSecrecy (Bool)
      - NSExceptionAllowsInsecureHTTPLoads (Bool)
      - NSRequiresCertificateTransparency (Bool)
      - NSIncludesSubdomains (Bool)
      - NSThirdPartyExceptionMinimumTLSVersion (String)
      - NSThirdPartyExceptionRequiresForwardSecrecy (Bool)
      - NSThirdPartyExceptionAllowsInsecureHTTPLoads (Bool)



### 참고 

https://medium.com/@stasost/ios-how-to-build-a-table-view-with-multiple-cell-types-2df91a206429

https://stackoverflow.com/questions/30774671/uitableview-with-more-than-one-custom-cells-with-swift

http://ste.vn/2015/06/10/configuring-app-transport-security-ios-9-osx-10-11/

https://developer.apple.com/library/ios/documentation/General/Reference/InfoPlistKeyReference/Articles/CocoaKeys.html

[https://blowmj.tistory.com/entry/iOS-iOS9-App-Transport-Security-설정법](https://blowmj.tistory.com/entry/iOS-iOS9-App-Transport-Security-설정법)

https://littleshark.tistory.com/1



----



## 개선 작업 중 추가로 알게 된 것들 … 매우 중요!!

#### 1) window hierarchy issue로 alert창이 안뜨는 경우 - no alert

- AlertController를 불러오는 동작이 viewDidLoad에서 실행되는 경우, window의 hierarchy가 형성되지 않았기 때문에 정상적으로 alert 창을 띄우지 못하게 됩니다.

- tableView의 아래 메서드는 viewDidLoad 후에 viewDidAppear 이전에 호출된다. 따라서 이 부분에서 (외부에서 주입받거나 viewDidApper에서 생성하는) 모델의 값을 참조하려고 하면 `nil 체크`를 해줘야 합니다.

  ```swift
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
  ```

  

  https://stackoverflow.com/questions/11862883/attempt-to-present-uiviewcontroller-on-uiviewcontroller-whose-view-is-not-in-the 



#### 2) appDelegate의 applicaiton 메서드에서 VC로 모델 주입하는 경우 - no alert

- 역시나 ***메서드의 호출 시점의 차이*** 로 발생하는 문제점입니다.

- 뷰컨트롤러의 `이니셜라이저` (임의로 개발자가 생성 못함)가 시스템 내부적으로 호출된 이후, AppDelegate의 `application` **메서드의 실행이 viewDidLoad 보다 우선해서 작동**하기때문에, **NotificationCenter의 옵저버 등록 이전에 post를 보내는 구조가 되어버립니다**. 따라서 alert창이 정상적으로 나타나지 않습니다. 

- 아래는 일부 메서드 호출 시점을 살펴본 디버거 메시지 입니다. 

  ```tex
  application(_:didFinishLaunchingWithOptions:)
  receiveJsonData()		/// < application 메서드에서 주입하는 경우
  "The file “customce” couldn’t be opened." /// < json 데이터 수신 에러 description
  viewDidLoad()		/// < NotificationCenter에 옵저버가 등록되는 시점
  tableView(_:numberOfRowsInSection:)
  tableView(_:numberOfRowsInSection:)	/// < model로부터 참고하는 시점
  tableView(_:numberOfRowsInSection:)
  tableView(_:numberOfRowsInSection:)
  viewDidAppear(_:)	/// < Notification에 post하거나 모델을 생성하기에 적당한 시점
  applicationDidBecomeActive(_:)
  ```

  

- 내부의 아카이빙 데이터를 로드할 때는 application 메서드 호출 시점에 로드를 해도 무방합니다. 

- 다만 **일반적으로 외부 네트워크를 통해 view의 Data를 load 하는 경우** 에는  `viewDidAppear 메서드` 나 `lazy` 프로퍼티를 통해 **viewDidLoad() 호출 후(옵저버등록 완료 후)에 호출** 하도록 시점을 조정하는 것이 바람직 하다고 판단됩니다.



### 3) `연결 취소` 시 앱을 background로 돌리기

-  네트워크/클라이언트 오류로 앱의 alert 창을 띄웠을 때, 재시도 하지 않고 앱을 background 상태로 돌리기 위해서는 `UIAlertAction` 의 **handler** 에 다음을 호출해 주면 됩니다.

  ```swift
  UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
  ```

  ```swift
  ///ex
  private func buildDefaultExitAction() -> UIAlertAction {
  	let defaultExitAction = UIAlertAction.init(title: ButtonMessage.exit.description, 
                                               style: .destructive) { (exit: UIAlertAction) in
  		if exit.isEnabled {
  			UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
  		}
  	}
  	return defaultExitAction
  }
  ```

  

