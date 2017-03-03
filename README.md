# KnobGestureRecognizer

[![Version](https://img.shields.io/cocoapods/v/KnobGestureRecognizer.svg?style=flat)](http://cocoapods.org/pods/KnobGestureRecognizer)
![Swift 3.0.x](https://img.shields.io/badge/Swift-3.0.x-orange.svg)


[![TheMindStudios](https://github.com/TheMindStudios/KnobGestureRecognizer/blob/readme/logo.png?raw=true)](https://themindstudios.com/)
## Features

  - [x] knob gesture
  - [x] get rotation radians of gesture
  - [x] set center of knob rotation
  - [x] get distance from center to touch (radius)
  - [x] get rotation direction (clockwise/ counter clockwise)

##Usage

  1. Import `KnobGestureRecognizer` module to your `BpmControlView` class

  ```swift
     import KnobGestureRecognizer
  ```
  2. Add gesture gecognizer `KnobGestureRecognizer` to `BpmControlView`

  ```swift
     override func awakeFromNib() {
         super.awakeFromNib()

         let gesture = KnobGestureRecognizer(target: self, action: #selector(rotationAction(_:)), to: controlView)

         gesture.delegate = self
         controlView.addGestureRecognizer(gesture)
     } 
  ```
  3. Processing callback 

  ```swift
      @objc fileprivate func rotationAction(_ sender: KnobGestureRecognizer) {
           ...
        }
  ```

##Installation with CocoaPods

   To install via CocoaPods add this lines to your Podfile. You need CocoaPods v. 1.1 or higher

```bash
  $ gem install cocoapods
```
####Podfile

To integrate KnobGestureRecognizer into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

target 'TargetName' do
  pod 'KnobGestureRecognizer', '~> 1.0'
end
```

Then, run the following command:

```bash
  $ pod install
```

##Properties

 Rotation in radians
 ```swift
 fileprivate(set) open var rotation: CGFloat = 0.0
 ```
 Rotation direction
 ```swift
 fileprivate(set) open var clockwiseDirection: Bool = true
 ```
 Distance from anchor point
 ```swift
 fileprivate(set) open var radius: Float? = 0.0
 ```
 Knob center
 ```swift
 open var anchor: CGPoint?
 ```
##License

KnobGestureRecognizer is available under the MIT license. See the LICENSE file for more info.

