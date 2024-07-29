//
//  ViewController.swift
//  MindView
//
//  Created by zhouxin on 07/27/2024.
//  Copyright (c) 2024 zhouxin. All rights reserved.
//

import UIKit
import MindView

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

class ViewController: UIViewController {
    
    let mindView = MindView(configuration: .init(contentInserts: .init(top: 0, left: 30, bottom: 0, right: 30), nodeSpacing: 10, zoomOutToShowComplete: true))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        mindView.frame = view.bounds
        view.addSubview(mindView)
        let node = MindNode(id: 1, nodeClass: NodeView.self, model: "中心主题", subNodes: [
            MindNode(id: 2, nodeClass: NodeView.self, model: "会议纪要", subNodes: [
                MindNode(id: 3, nodeClass: NodeView.self, model: "纪要1", subNodes: [
                    MindNode(id: 103, nodeClass: NodeView.self, model: "纪要1", subNodes: []),
                    MindNode(id: 104, nodeClass: NodeView.self, model: "会纪要2", subNodes: []),
                    MindNode(id: 105, nodeClass: NodeView.self, model: "会议纪dddd要3", subNodes: []),
                    MindNode(id: 106, nodeClass: NodeView.self, model: "会议", subNodes: []),
                ]),
                MindNode(id: 4, nodeClass: NodeView.self, model: "会纪要2", subNodes: []),
                MindNode(id: 5, nodeClass: NodeView.self, model: "会议纪dddd要3", subNodes: []),
                MindNode(id: 6, nodeClass: NodeView.self, model: "会议", subNodes: []),
            ]),
            MindNode(id: 100, nodeClass: NodeView.self, model: "会议纪要", subNodes: [
                MindNode(id: 101, nodeClass: NodeView.self, model: "纪要1", subNodes: []),
            ]),
            MindNode(id: 7, nodeClass: NodeView.self, model: "会议纪要", subNodes: [
                MindNode(id: 8, nodeClass: NodeView.self, model: "纪要1", subNodes: []),
                MindNode(id: 9, nodeClass: NodeView.self, model: "会纪要2", subNodes: [
                    MindNode(id: 113, nodeClass: NodeView.self, model: "纪要1", subNodes: []),
                    MindNode(id: 114, nodeClass: NodeView.self, model: "会纪要2", subNodes: []),
                    MindNode(id: 115, nodeClass: NodeView.self, model: "会议纪dddd要3", subNodes: []),
                    MindNode(id: 116, nodeClass: NodeView.self, model: "会议", subNodes: []),
                ]),
                MindNode(id: 10, nodeClass: NodeView.self, model: "会议纪dddd要3", subNodes: []),
            ]),
            MindNode(id: 11, nodeClass: NodeView.self, model: "会议纪要", subNodes: [
                MindNode(id: 12, nodeClass: NodeView.self, model: "纪要1", subNodes: []),
                MindNode(id: 13, nodeClass: NodeView.self, model: "会纪要2", subNodes: []),
            ]),
            MindNode(id: 14, nodeClass: NodeView.self, model: "会议纪要", subNodes: [
                MindNode(id: 15, nodeClass: NodeView.self, model: "纪要1", subNodes: []),
                MindNode(id: 16, nodeClass: NodeView.self, model: "会纪要2", subNodes: [
                    MindNode(id: 123, nodeClass: NodeView.self, model: "纪要1", subNodes: []),
                    MindNode(id: 124, nodeClass: NodeView.self, model: "会纪要2", subNodes: []),
                    MindNode(id: 125, nodeClass: NodeView.self, model: "会议纪dddd要3", subNodes: []),
                    MindNode(id: 126, nodeClass: NodeView.self, model: "会议", subNodes: []),
                ]),
                MindNode(id: 17, nodeClass: NodeView.self, model: "会议纪dddd要3", subNodes: []),
            ]),
        ])
        mindView.setup(root: node)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.mindView.frame = view.bounds
    }

}

