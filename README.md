# MapRegionMaker
The easy way to create a map region around sets of coordinates in Swift.

[![Version](https://img.shields.io/cocoapods/v/MapRegionMaker.svg?style=flat)](http://cocoapods.org/pods/RKCollectionViewStaggeredLayout)
[![License](https://img.shields.io/cocoapods/l/MapRegionMaker.svg?style=flat)](http://cocoapods.org/pods/RKCollectionViewStaggeredLayout)
[![Platform](https://img.shields.io/cocoapods/p/MapRegionMaker.svg?style=flat)](http://cocoapods.org/pods/RKCollectionViewStaggeredLayout)

When you have a map view in an iOS application, you may wish to add annotations or poly lines, etc. After adding them, you'd like to have the map zoom to a region that contains all the coordinates and maybe a little bit of padding on the sides. This simple framework makes it easy.

## Installation

### CocoaPods
Add to your pod file:

```pod 'MapRegionMaker'```

### Manually
Simply drop the file into your project.

## Usage

Import:

```
Import MapRegionMaker
```

Create an instance of MapRegionMaker

```
let mapRegionMaker = MapRegionMaker()
```

Add coordinates, either as singles or arrays.

## Roadmap

* CocoaPod support coming soon.
* Better usage example coming soon.

## About

This framework was created by David Lari. It is dreadfully simple, but I wanted to get some practice creating frameworks, pushing them to github, and setting up pods. Pull requests and suggestions are welcome. If you have questions, please create an issue.
