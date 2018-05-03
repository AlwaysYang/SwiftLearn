//
//  UIBarButtonItem+BAKit.swift
//  yunLianApp
//
//  Created by boai on 2018/1/8.
//  Copyright © 2018年 云联惠. All rights reserved.
//

import Foundation
import UIKit

extension UIBarButtonItem {
    
    public func ba_setBarButtonItem(titleString:String?, imageName:String?, target: Any?, action: Selector?) -> UIBarButtonItem {
        
        var barButtonItem = UIBarButtonItem()
        
        if !BAKit_StringIsEmpty(string: titleString)
        {
            barButtonItem = UIBarButtonItem.init(title: titleString, style: .plain, target: target, action: action)
        }
        if !BAKit_StringIsEmpty(string: imageName)
        {
            barButtonItem = UIBarButtonItem.init(image: UIImage.init(named: imageName!), style: .plain, target: self, action: action)
        }
        
//        navitationRightActionBlock = action
        
        return barButtonItem
    }
    
//    @objc func handleRightNaviSetAction() -> Void  {
//        if (navitationRightActionBlock != nil)
//        {
//            navitationRightActionBlock!()
//        }
//    }
    
    ///UIBarButtonItem
    ///
    /// - parameter setHighlightedImg: 背景图片
    /// - parameter title:             标题
    /// - parameter target:            target
    /// - parameter action:            action
    ///
    /// - returns: <#return value description#>
    convenience init(setHighlightedImg:String? ,title:String? ,target:Any?,action:Selector) {
        self.init()
        let  button = UIButton(setHighlightImage:setHighlightedImg, title: title, target: target, action: action)
        self.customView = button
    }
}
