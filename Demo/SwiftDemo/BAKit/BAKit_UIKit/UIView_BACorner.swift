//
//  UIView+BACorner.swift
//  yunLianApp
//
//  Created by boai on 2018/1/9.
//  Copyright © 2018年 云联惠. All rights reserved.
//

import Foundation
import UIKit
///在使用xib或者storyboard时,写在layoutIfNeeded()方法中
extension UIView {
    /// 部分圆角
    /// - Parameters:
    ///   - corners: 需要实现为圆角的角，可传入多个
    ///   - radii: 圆角半径
    func ba_viewCorner(byRoundingCorners corners:UIRectCorner, borderColor:UIColor?, borderWidth:CGFloat?, cornerRadii: CGFloat) {
        
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadii, height: cornerRadii))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = maskPath.cgPath
        shapeLayer.frame = self.bounds

        let borderLayer = CAShapeLayer()
        borderLayer.frame = self.bounds
        borderLayer.path = maskPath.cgPath
        borderLayer.lineWidth = borderWidth!
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.strokeColor = borderColor?.cgColor
        borderLayer.lineCap = kCALineCapSquare

        self.layer.mask = shapeLayer
        self.layer.addSublayer(borderLayer)
    }
    
    /// 全部圆角
    /// - Parameters:
    ///   - radii: 圆角半径
    func ba_viewCornerAllRound(cornerRadii: CGFloat, borderColor:UIColor?, borderWidth:CGFloat?) {
        self.ba_viewCorner(byRoundingCorners: UIRectCorner.allCorners, borderColor: borderColor, borderWidth: borderWidth, cornerRadii: cornerRadii)
    }
    
}
