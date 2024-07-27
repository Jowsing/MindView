//
//  MindNodable.swift
//  MindView
//
//  Created by jowsing on 2024/7/27.
//

import UIKit

public protocol MindNodable: UIView {
    
    associatedtype Model
    
    func configure(_ model: Model)
    
    func nodeWidthThatFits(_ nodeHeight: CGFloat) -> CGFloat
}

extension MindNodable {
    
    func setModel(_ model: Any?) {
        guard let model = model as? Model else { return }
        configure(model)
    }
    
    func nodeToFits(_ nodeHeight: CGFloat) {
        let width = nodeWidthThatFits(nodeHeight)
        frame.size = CGSize(width: width, height: nodeHeight)
    }
}
