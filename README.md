# MindView

[![Version](https://img.shields.io/cocoapods/v/MindView.svg?style=flat)](https://cocoapods.org/pods/MindView)
[![License](https://img.shields.io/cocoapods/l/MindView.svg?style=flat)](https://cocoapods.org/pods/MindView)
[![Platform](https://img.shields.io/cocoapods/p/MindView.svg?style=flat)](https://cocoapods.org/pods/MindView)

## Example

![Screenshot](https://github.com/Jowsing/MindView/blob/main/images/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20-%202024-07-27%20at%2013.30.49.png)
! [Screenshot](https://github.com/Jowsing/MindView/blob/main/images/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20-%202024-07-27%20at%2018.11.29.png)

### Coding

#### The Mind Node View
You can use any UIKit view
```swift
class NodeView: UILabel, MindNodable {
    typealias Model = String
    
    func configure(_ model: String) {
        self.text = model
        self.textColor = .systemRed
        self.font = .systemFont(ofSize: 17)
    }
    
    func nodeWidthThatFits(_ nodeHeight: CGFloat) -> CGFloat {
        return sizeThatFits(.init(width: .greatestFiniteMagnitude, height: nodeHeight)).width
    }
}
```

#### Create The MindView
```swift
    let configuration = MindConfiguration(contentInserts: .init(top: 0, left: 30, bottom: 0, right: 30))
    
    let mindView = MindView(configuration: configuration)
    
    let node = MindNode(id: 1, nodeClass: NodeView.self, model: "中心主题", subNodes: [
        MindNode(id: 2, nodeClass: NodeView.self, model: "会议纪要", subNodes: [
            MindNode(id: 3, nodeClass: NodeView.self, model: "纪要1", subNodes: []),
            MindNode(id: 4, nodeClass: NodeView.self, model: "会纪要2", subNodes: []),
            MindNode(id: 5, nodeClass: NodeView.self, model: "会议纪dddd要3", subNodes: []),
            MindNode(id: 6, nodeClass: NodeView.self, model: "会议", subNodes: []),
        ]),
        MindNode(id: 100, nodeClass: NodeView.self, model: "会议纪要", subNodes: [
            MindNode(id: 101, nodeClass: NodeView.self, model: "纪要1", subNodes: []),
        ]),
        MindNode(id: 7, nodeClass: NodeView.self, model: "会议纪要", subNodes: [
            MindNode(id: 8, nodeClass: NodeView.self, model: "纪要1", subNodes: []),
            MindNode(id: 9, nodeClass: NodeView.self, model: "会纪要2", subNodes: []),
            MindNode(id: 10, nodeClass: NodeView.self, model: "会议纪dddd要3", subNodes: []),
        ]),
        MindNode(id: 11, nodeClass: NodeView.self, model: "会议纪要", subNodes: [
            MindNode(id: 12, nodeClass: NodeView.self, model: "纪要1", subNodes: []),
            MindNode(id: 13, nodeClass: NodeView.self, model: "会纪要2", subNodes: []),
        ]),
        MindNode(id: 14, nodeClass: NodeView.self, model: "会议纪要", subNodes: [
            MindNode(id: 15, nodeClass: NodeView.self, model: "纪要1", subNodes: []),
            MindNode(id: 16, nodeClass: NodeView.self, model: "会纪要2", subNodes: []),
            MindNode(id: 17, nodeClass: NodeView.self, model: "会议纪dddd要3", subNodes: []),
        ]),
    ])
    
    mindView.setup(root: node)
```

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

MindView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MindView'
```

## Author

jowsing, jowsing169@gmail.com

## License

MindView is available under the MIT license. See the LICENSE file for more info.
