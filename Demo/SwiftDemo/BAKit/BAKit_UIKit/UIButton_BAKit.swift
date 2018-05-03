//
//  UIButton+BAKit.swift
//  yunLianApp
//
//  Created by boai on 2018/1/3.
//  Copyright © 2018年 云联惠. All rights reserved.
//

import Foundation
import UIKit



/*
 枚举 设置 图片的位置
 */
public enum BAKit_ButtonLayoutType : Int{
    
    case BAKit_ButtonLayoutTypeImageTop = 0
    case BAKit_ButtonLayoutTypeImageleft
    case BAKit_ButtonLayoutTypeImageBottom
    case BAKit_ButtonLayoutTypeImageRight
}

extension UIButton {
    
    public typealias BAKit_ButtonActionBlock = ((_ sender:UIButton) -> Void)?
    private struct BAKit_ButtonAssociatedKeys {
        static var ba_buttonActionBlockKey = "ba_buttonActionBlockKey"
    }
    
    /**
     imageName:图片的名字
     title：button 的名字
     type ：image 的位置
     Space ：图片文字之间的间距
     */
    public func ba_buttonSetImageAndTitle(imageName:String, title:String, type:BAKit_ButtonLayoutType, Space space:CGFloat) -> Void  {
        
        self.setTitle(title, for: .normal)
        self.setImage(UIImage(named:imageName), for: .normal)
        
        let imageWith :CGFloat = (self.imageView?.frame.size.width)!;
        let imageHeight :CGFloat = (self.imageView?.frame.size.height)!;
        
        var labelWidth :CGFloat = 0.0;
        var labelHeight :CGFloat = 0.0;
        
        labelWidth = CGFloat(self.titleLabel!.intrinsicContentSize.width);
        labelHeight = CGFloat(self.titleLabel!.intrinsicContentSize.height);
        
        var  imageEdgeInsets :UIEdgeInsets = UIEdgeInsets();
        var  labelEdgeInsets :UIEdgeInsets = UIEdgeInsets();
        
        switch type {
        case .BAKit_ButtonLayoutTypeImageTop:
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight - space/2.0, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-space/2.0, 0);
            break;
        case .BAKit_ButtonLayoutTypeImageleft:
            imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, space/2.0, 0, -space/2.0);
            break;
        case .BAKit_ButtonLayoutTypeImageBottom:
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space/2.0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space/2.0, -imageWith, 0, 0);
            break;
        case .BAKit_ButtonLayoutTypeImageRight:
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space/2.0, 0, -labelWidth-space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-space/2.0, 0, imageWith+space/2.0);
            break;
        }
        
        // 4. 赋值
        self.titleEdgeInsets = labelEdgeInsets;
        self.imageEdgeInsets = imageEdgeInsets;
    }
    
    @objc func handleButtonAction() -> Void {
        if self.ba_buttonActionBlock != nil
        {
            self.ba_buttonActionBlock!!(self)
        }
    }
    
    // MARK: - setter, getter
    public var ba_buttonActionBlock : BAKit_ButtonActionBlock?{
        set
        {
            self.addTarget(self, action: #selector(handleButtonAction), for: .touchUpInside)
            
            if let newValue = newValue
            {
                objc_setAssociatedObject( self, &BAKit_ButtonAssociatedKeys.ba_buttonActionBlockKey, newValue as BAKit_ButtonActionBlock? as Any, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY)
            }
        }
        get
        {
            return objc_getAssociatedObject(self, &BAKit_ButtonAssociatedKeys.ba_buttonActionBlockKey) as! BAKit_ButtonActionBlock
        }
    }
    
    
    
    // 遍历构造函数
    /// 创建button
    ///
    /// - parameter setImage:           默认状态图片
    /// - parameter setBackgroundImage: 背景图片
    /// - parameter target:             target
    /// - parameter action:             action
    ///
    /// - returns:
    convenience init(setImage:String,setBackgroundImage:String,target:Any?,action:Selector ){
        //        let Btn = UIButton()
        self.init()
        
        self.setImage(UIImage(named:setImage), for: UIControlState.normal)
        self.setImage(UIImage(named:"\(setImage)_highlighted"), for: UIControlState.highlighted)
        self.setBackgroundImage(UIImage(named:setBackgroundImage), for: UIControlState.normal)
        self.setBackgroundImage(UIImage(named:"\(setBackgroundImage)_highlighted"), for: UIControlState.highlighted)
        
        self.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
        
        self.sizeToFit()
    }
    
    
    
    /// 返回带文字的图片的按钮
    ///
    /// - parameter setHighlightImage: 背景图片
    /// - parameter title:             文字
    /// - parameter target:            target
    /// - parameter action:            action
    ///
    /// - returns:
    convenience init(setHighlightImage:String?,title:String?,target:Any?,action:Selector ){
        self.init()
        
        if let img = setHighlightImage {
            self.setImage(UIImage(named:img), for: UIControlState.normal)
            self.setImage(UIImage(named:"\(img)_highlighted"), for: UIControlState.highlighted)
        }
        
        if let tit = title {
            self.setTitle(tit, for: UIControlState.normal)
            self.setTitleColor(UIColor.blue, for: UIControlState.normal)
            self.setTitleColor(LLTHEMECOLOR, for: UIControlState.highlighted)
            self.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        }
        self.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
        
        self.sizeToFit()
        
    }
    
    convenience init(BackgroundImage:String?,title:String?,titleColor:UIColor, target:Any?,action:Selector ){
        
        self.init()
        
        self.setBackgroundImage(UIImage(named:BackgroundImage!), for: UIControlState.normal)
        self.setTitle(title, for: UIControlState.normal)
        self.setTitleColor(titleColor, for: UIControlState.normal)
        
        self.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
        
        self.sizeToFit()
        
    }
    
    
}

