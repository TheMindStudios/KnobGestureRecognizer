# KnobGestureRecognizer

[![CI Status](http://img.shields.io/travis/hapichdima/KnobGestureRecognizer.svg?style=flat)](https://travis-ci.org/hapichdima/KnobGestureRecognizer)
[![Version](https://img.shields.io/cocoapods/v/KnobGestureRecognizer.svg?style=flat)](http://cocoapods.org/pods/KnobGestureRecognizer)
[![License](https://img.shields.io/cocoapods/l/KnobGestureRecognizer.svg?style=flat)](http://cocoapods.org/pods/KnobGestureRecognizer)
[![Platform](https://img.shields.io/cocoapods/p/KnobGestureRecognizer.svg?style=flat)](http://cocoapods.org/pods/KnobGestureRecognizer)

## Features

 - [x] knob gesture
 - [x] get rotation radians of gesture
 - [x] set center of knob rotation
 - [x] get distance from center to touch (radius)
 - [x] get rotation direction (clockwise/ counter clockwise)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation with CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like KnobGestureRecognizer in your projects. See the . You can install it with the following command:

```bash
$ gem install cocoapods
```
#### Podfile

To integrate KnobGestureRecognizer into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'

target 'TargetName' do
pod 'KnobGestureRecognizer', '~> 1.0'
end
```

Then, run the following command:

```bash
$ pod install
```


## Installation

KnobGestureRecognizer is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "KnobGestureRecognizer"
```


##Properties

 Rotation in radians
 ```swift
 fileprivate(set) open var rotation: CGFloat = 0.0

 Rotation direction
 ```swift
 fileprivate(set) open var clockwiseDirection: Bool = true

 Distance from anchor point
 ```swift
 fileprivate(set) open var radius: Float? = 0.0

 View
 ```swift
 fileprivate(set) var controlView: UIView!

 Knob center
 ```swift
 open var anchor: CGPoint?

## License

KnobGestureRecognizer is available under the MIT license. See the LICENSE file for more info.

