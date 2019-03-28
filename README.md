# swift-weatherapp
STEP18 날씨 앱 저장소

### step-01. UITableViewController

#### 배운내용

- `Static Cells` 는 UITableViewController에서만 사용이 가능하다.

<img src="https://user-images.githubusercontent.com/38850628/55056799-8a82c880-50aa-11e9-9cf0-c901a770a749.png" height="700">

### step-02. DataSource 객체

#### 배운내용

- `"""` 으로 여러줄의 문자열을 묶기 좋다. 여러줄의 JSON문자열을 묶는데 매우 효과적이었다. (쓸 일이 거의 없었다가 이번에 처음 써봄)

##### JSONSerialization을 이용하면 Foundation객체를 JSON으로 JSON을 Foundation객체로 변환할수 있다.
##### 여기서 사용되는 Foundation객체는 다음과 같은 특성을 가진다.

- The top level object is an NSArray or NSDictionary.

- All objects are instances of NSString, NSNumber, NSArray, NSDictionary, or NSNull.

- All dictionary keys are instances of NSString.

- Numbers are not NaN or infinity. 

##### `isValidJSONObject(_:)`를 통해 JSON데이터로 변환 가능여부를 알 수 있다.

##### iOS 7 이상 macOS 10.9 이상 버전에서 JSONSerialization은 `thread safe`합니다.

##### thread safe란?
멀티 스레드 프로그래밍에서 어떠한 변수, 함수, 객체가 여러 스레드로부터 동시에 접근 당해도 안전하다는 것


<img src="https://user-images.githubusercontent.com/38850628/55127578-f705d200-5153-11e9-8e3e-4a3185a76805.png" height="700">
