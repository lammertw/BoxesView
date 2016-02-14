# BoxesView

BoxesView is a UIView for iOS that lays out subviews as boxes, much like a simplified version of a UICollectionView.

It completely layed out using auto layout constraints and therefore fits in modern apps. It's a simplified version of a `UICollectionView` that doesn't need any delegate or data source. You just configure the number of columns you want and set the views that you want to be displayed in boxes.

![Screenshot 1](http://i.imgur.com/D7IqjMWl.png, "Example of BoxesView")
![Screenshot 2](http://i.imgur.com/wuWclAXl.png, "Example 2 of BoxesView")

[![Version](https://img.shields.io/cocoapods/v/BoxesView.svg?style=flat)](http://cocoapods.org/pods/BoxesView)
[![License](https://img.shields.io/cocoapods/l/BoxesView.svg?style=flat)](http://cocoapods.org/pods/BoxesView)
[![Platform](https://img.shields.io/cocoapods/p/BoxesView.svg?style=flat)](http://cocoapods.org/pods/BoxesView)

## Requirements

- Swift 2.0
- iOS 8.0+
- Xcode 7.2+

## Installation

BoxesView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

pod "BoxesView"
```

Then, run the following command:

```bash
$ pod install
```

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

### Add to your project

Use the `BoxesView` in your project as you would use any other `UIView`. For example in a Storyboard. The BoxesView has an intrinsic height so you do not have to specify a height for it (although you can give it a explicit height). The simple assign the boxes views to it:

	@IBOutlet weak var boxesView: BoxesView! {
		didSet {
			boxesView.boxes = [
				view1,
				someImageView,
				view2
			]
		}
	}

The boxes will be layed out in a similar fashion as in a Collection View.

### Options

There are a few options available to a BoxesView. These are all variables with `@IBInspectable` and thus can be set in your Storyboard.

- [x] __columns__ Determines the number of columns that your BoxesView should have. Defaults to 2
- [x] __rowHeight__ Use this to specify a fixed row height. If you specify -1 (which is the default) your box views need to have an (intrinsic) height and the row height will be determined by the box in the row with the greatest height.

# Dependency

This library depends on [SnapKit](http://snapkit.io/) to create the necessary auto layout constraints.

## Author

Lammert Westerhoff, westerhoff@gmail.com

## License

BoxesView is available under the MIT license. See the LICENSE file for more info.
