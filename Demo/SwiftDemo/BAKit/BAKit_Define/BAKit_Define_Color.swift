//
//  BAKit_Define_Color.swift
//  yunLianApp
//
//  Created by boai on 2018/1/2.
//  Copyright © 2018年 云联惠. All rights reserved.
//

import Foundation
import UIKit

public func BAKit_UIColorRGBA(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}

public func BAKit_UIColorRGB(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
    return BAKit_UIColorRGBA(r: r, g: g, b: b, a: 1.0)
}

/**
 *  颜色 rgbValue: 带有alpha的16进制的rgb色值,
 */
public func BAKit_UIColorHexA(_ rgbValue:NSInteger, _ alpha:CGFloat) -> UIColor {
    let color = UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16))/255.0, green: ((CGFloat)((rgbValue & 0xFF00) >> 8))/255.0, blue: ((CGFloat)(rgbValue & 0xFF))/255.0, alpha: alpha)
    return color
}

/**
 *  颜色 rgbValue: 16进制的 rgb 色值
 */
public func BAKit_UIColorHex(_ rgbValue:NSInteger) -> UIColor {
    return BAKit_UIColorHexA(rgbValue, 1.0)
}

let MAINTHEMECOLOR = BAKit_UIColorHex(0x08b6f8)

/*! 半透明遮罩色  */
var BAKit_Color_Translucent = BAKit_UIColorRGB(r: 76.5, g: 76.5, b: 76.5)

/*! 白色 1.0 white */
var BAKit_Color_White = UIColor.white

/*! 红色 1.0, 0.0, 0.0 RGB */
var BAKit_Color_Red = UIColor.red

/*! 黄色 1.0, 1.0, 0.0 RGB */
var BAKit_Color_Yellow = UIColor.yellow

/*! 绿色 0.0, 1.0, 0.0 RGB */
var BAKit_Color_Green = UIColor.green

/*! 蓝色 0.0, 0.0, 1.0 RGB */
var BAKit_Color_Blue = UIColor.blue

/*! 无色 0.0 white, 0.0 alpha */
var BAKit_Color_Clear = UIColor.clear

/*! 橙色 1.0, 0.5, 0.0 RGB */
var BAKit_Color_Orange = UIColor.orange

/*! 黑色 0.0 white */
var BAKit_Color_Black = UIColor.black

/*! 浅灰色 0.667 white */
var BAKit_Color_LightGray = UIColor.lightGray

/*! 青色 0.0, 1.0, 1.0 RGB */
var BAKit_Color_Cyan = UIColor.cyan

/*! 红褐色 1.0, 0.0, 1.0 RGB */
var BAKit_Color_Magenta = UIColor.magenta

/*! 棕色 0.6, 0.4, 0.2 RGB */
var BAKit_Color_Brown = UIColor.brown

/*! 紫色 0.5, 0.0, 0.5 RGB */
var BAKit_Color_Purple = UIColor.purple

