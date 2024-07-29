//
//  MindConfiguration.swift
//  MindView
//
//  Created by jowsing on 2024/7/27.
//

import Foundation

public struct MindConfiguration {
    
    let contentInserts: UIEdgeInsets
    
    let nodeHeight: CGFloat
    
    let nodeSpacing: CGFloat
        
    let sectionSpacing: CGFloat
    
    let minimumZoomScale: CGFloat
    
    let maximumZoomScale: CGFloat
    
    let curveLinesColor: UIColor
    /// 为了展示完整而缩小
    let zoomOutToShowComplete: Bool
    
    public init(contentInserts: UIEdgeInsets = .zero, nodeHeight: CGFloat = 40, nodeSpacing: CGFloat = 0, sectionSpacing: CGFloat = 60, minimumZoomScale: CGFloat = 0.5, maximumZoomScale: CGFloat = 3, curveLinesColor: UIColor = UIColor.systemBlue, zoomOutToShowComplete: Bool = false) {
        self.contentInserts = contentInserts
        self.nodeHeight = nodeHeight
        self.nodeSpacing = nodeSpacing
        self.sectionSpacing = sectionSpacing
        self.minimumZoomScale = minimumZoomScale
        self.maximumZoomScale = maximumZoomScale
        self.curveLinesColor = curveLinesColor
        self.zoomOutToShowComplete = zoomOutToShowComplete
    }
}
