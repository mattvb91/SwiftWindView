# SwiftWindView
WindView built in swift

![](https://github.com/mattvb91/SwiftWindView/blob/master/art.gif?raw=true)

### Installing

```
pod "SwiftWindView"
```

### Usage

```swift
override func viewDidLoad() {
		super.viewDidLoad()
		
		let windview = SwiftWindView(windSpeed: 8, pressure: 2, unit: "km/h")
		
		let frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 220)
		windview.frame = frame
				
		self.view.addSubview(windview)
	}

```


