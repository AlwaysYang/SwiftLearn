//
//  UIImage+BAKit.swift
//  yunLianApp
//
//  Created by boai on 2018/1/2.
//  Copyright © 2018年 云联惠. All rights reserved.
//

import Foundation
import UIKit


extension UIImage {
    
    /// UIImage：纯颜色图片
    ///
    /// - Parameters:
    ///   - color: 颜色
    ///   - viewSize: size
    /// - Returns: 纯颜色图片
    public func ba_imageWithColor(color: UIColor, viewSize: CGSize) -> UIImage {
        let rect: CGRect = CGRect(x: 0, y: 0, width: viewSize.width, height: viewSize.height)
        UIGraphicsBeginImageContext(rect.size)
        
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        context.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsGetCurrentContext()
        
        return image!
    }
    
    // MARK: 纯颜色转图片
    func imageWithColor(color: UIColor) -> UIImage {
        return imageWithColor(color: color, size: CGSize(width: 1, height: 1))
    }
    
    func imageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(rect.size)
        
        let context : CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        context.fill(rect)
        
        let image : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return image
    }
}
