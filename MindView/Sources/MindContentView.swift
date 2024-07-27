//
//  MindContentView.swift
//  MindView
//
//  Created by jowsing on 2024/7/27.
//

import UIKit

class MindContentView: UIView {
    
    // MARK: - Property (assign)
    
    var root: MindNode? {
        didSet {
            drawCurveLines()
        }
    }
    
    // MARK: - Property (lazy)
    
    lazy var curveLinesLayer = {
        let layer = CAShapeLayer()
        layer.lineWidth = 1
        layer.fillColor = UIColor.clear.cgColor
        return layer
    }()
    
    lazy var arrowLayer = {
        let layer = CAShapeLayer()
        layer.strokeColor = UIColor.clear.cgColor
        return layer
    }()
    
    // MARK: - Life Cycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if curveLinesLayer.frame != bounds {
            curveLinesLayer.frame = bounds
            arrowLayer.frame = bounds
        }
    }
    
    private func drawCurveLines() {
        guard let node = root, let rootView = viewWithTag(node.id) else { return }
        let curvePath = UIBezierPath()
        let arrowPath = UIBezierPath()
        drawCurveLines(rootView, nodes: node.subNodes, curvePath: curvePath, arrowPath: arrowPath)
        curveLinesLayer.path = curvePath.cgPath
        arrowLayer.path = arrowPath.cgPath
        layer.addSublayer(curveLinesLayer)
        layer.addSublayer(arrowLayer)
    }
    
    private func drawCurveLines(_ root: UIView, nodes: [MindNode], curvePath: UIBezierPath, arrowPath: UIBezierPath) {
        nodes.forEach { node in
            guard let subView = viewWithTag(node.id) else { return }
            let start = CGPoint(x: root.frame.maxX + 6, y: root.center.y)
            let end = CGPoint(x: subView.frame.minX - 11, y: subView.center.y)
            curvePath.move(to: start)
            let controlX = start.x + (root.tag == -1 ? 30 : 20)
            curvePath.addCurve(to: end, controlPoint1: .init(x: controlX, y: start.y), controlPoint2: .init(x: controlX, y: end.y))
            
            let rpath = UIBezierPath()
            rpath.move(to: .init(x: end.x, y: end.y - 3))
            rpath.addLine(to: .init(x: end.x + 5, y: end.y))
            rpath.addLine(to: .init(x: end.x, y: end.y + 3))
            rpath.close()
            arrowPath.append(rpath)
            
            drawCurveLines(subView, nodes: node.subNodes, curvePath: curvePath, arrowPath: arrowPath)
        }
    }
}
