//
//  MindMap.swift
//  MindView
//
//  Created by jowsing on 2024/7/27.
//

import Foundation

public struct MindNode {
    
    public let id: Int
    
    public let nodeClass: any MindNodable.Type
    
    public let model: Any?
    
    public let subNodes: [MindNode]
    
    public init(id: Int, nodeClass: any MindNodable.Type, model: Any?, subNodes: [MindNode]) {
        self.id = id
        self.nodeClass = nodeClass
        self.model = model
        self.subNodes = subNodes
    }
    
    func nodeView() -> any MindNodable {
        let nodeView = nodeClass.init()
        nodeView.tag = id
        nodeView.setModel(model)
        return nodeView
    }
    
    /// 最底部节点的数量
    /// packs: 是否收起子节点 (node id -> bool)
    func lastCount(_ packs: [Int: Bool]) -> Int {
        if packs[id] == true {
            return 1
        }
        if subNodes.isEmpty {
            return 1
        }
        var count = 0
        subNodes.forEach {
            count += $0.lastCount(packs)
        }
        return count
    }
}
