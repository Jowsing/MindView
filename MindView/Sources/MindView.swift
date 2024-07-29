//
//  MindView.swift
//  MindView
//
//  Created by jowsing on 2024/7/27.
//

import UIKit

public class MindView: UIScrollView {
    
    // MARK: - Property (assign)
    
    public let configuration: MindConfiguration
    
    /// 展开收起的map(node id -> 是否收起)
    private(set) var packs = [Int: Bool]()
    
    /// sub node id -> node id
    private var subToNode = [Int: Int]()
    
    private var rootNode: MindNode?
    
    private var boundsSize = CGSize.zero {
        didSet {
            if Int(boundsSize.width) != Int(oldValue.width) {
                updateContentSize()
            }
        }
    }
    
    // MARK: - Property (retain)
    
    private let contentView = MindContentView()
        
    // MARK: - Life Cycle
    
    public init(configuration: MindConfiguration) {
        self.configuration = configuration
        super.init(frame: .zero)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.boundsSize = bounds.size
    }
    
    public func setupUI() {
        self.contentInsetAdjustmentBehavior = .never
        self.delegate = self
        self.minimumZoomScale = configuration.minimumZoomScale
        self.maximumZoomScale = configuration.maximumZoomScale
        self.addSubview(contentView)
        contentView.curveLinesLayer.strokeColor = configuration.curveLinesColor.cgColor
        contentView.arrowLayer.fillColor = configuration.curveLinesColor.cgColor
        
        let doubleTaper = UITapGestureRecognizer(target: self, action: #selector(doubleTap))
        doubleTaper.numberOfTapsRequired = 2
        self.addGestureRecognizer(doubleTaper)
    }
    
    func zoomToCenter() -> CGPoint {
        let offsetX = bounds.width > contentSize.width ? (bounds.width - contentSize.width) * 0.5 : 0
        let offsetY = bounds.height > contentSize.height ? (bounds.height - contentSize.height) * 0.5 : 0
        return CGPoint(x: contentSize.width * 0.5 + offsetX, y: contentSize.height * 0.5 + offsetY)
    }
    
    @objc private func doubleTap() {
        self.setZoomScale(1, animated: true)
        self.setContentOffset(.zero, animated: true)
    }
    
    public func setup(root node: MindNode) {
        rootNode = node
        packs = [:]
        subToNode = [:]
        contentView.subviews.forEach {
            $0.removeFromSuperview()
        }
        
        node.subNodes.forEach {
            subToNode[$0.id] = node.id
        }
        let rootNodeView = node.nodeView()
        rootNodeView.nodeToFits(configuration.nodeHeight)
        rootNodeView.frame.origin.x = configuration.contentInserts.left
        contentView.addSubview(rootNodeView)
        setupNodes(node.subNodes, top: configuration.contentInserts.top, level: 1)
        rootNodeView.center.y = contentView.bounds.height * 0.5
        updateContentSize()
        contentView.root = node
    }
    
    private func setupNodes(_ nodes: [MindNode], top: CGFloat, level: Int) {
        if nodes.isEmpty {
            return
        }
        var nodeY: CGFloat = top
        for i in 0..<nodes.count {
            let node = nodes[i]
            node.subNodes.forEach {
                subToNode[$0.id] = node.id
            }
            let lastCount = CGFloat(node.lastCount(packs))
            let nodeH = lastCount * (configuration.nodeHeight + configuration.nodeSpacing) - configuration.nodeSpacing
            let nodeView = node.nodeView()
            nodeView.nodeToFits(configuration.nodeHeight)
            nodeView.center.y = nodeH * 0.5 + nodeY
            if let parentId = subToNode[node.id], let parentView = viewWithTag(parentId) {
                nodeView.frame.origin.x = parentView.frame.maxX + configuration.sectionSpacing
                if level == 1 {
                    nodeView.frame.origin.x += 20
                }
            }
            
            let maxX = nodeView.frame.maxX + configuration.contentInserts.right
            if contentView.bounds.width < maxX {
                contentView.frame.size.width = maxX
            }
            contentView.addSubview(nodeView)
            setupNodes(node.subNodes, top: nodeY, level: level + 1)
            
            nodeY += nodeH
            /// 插入间隔
            if i != nodes.count - 1 {
                nodeY += configuration.nodeSpacing
            }
        }
        if level == 1 {
            let height = nodeY + top
            contentView.frame.size.height = height
        }
    }
    
    public func update(packs: [Int: Bool]) {
        self.packs = packs
        guard let rootNode = rootNode else { return }
        self.setup(root: rootNode)
    }
    
    private func updateContentSize() {
        let contentSize = CGSize(width: max(bounds.width, contentView.bounds.width),
                                 height: max(bounds.height, contentView.bounds.height))
        if self.contentSize != contentSize {
            self.contentSize = contentSize
            contentView.center = zoomToCenter()
        }
    }
}

extension MindView: UIScrollViewDelegate {
    
    public func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return contentView
    }
    
    public func scrollViewDidZoom(_ scrollView: UIScrollView) {
        contentView.center = zoomToCenter()
    }
}
