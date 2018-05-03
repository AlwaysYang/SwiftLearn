//
//  BAKit_Define_Frame.swift
//  yunLianApp
//
//  Created by boai on 2018/1/2.
//  Copyright © 2018年 云联惠. All rights reserved.
//

import Foundation
import UIKit

public let BAKit_Define_Frame_ScreenWidth      = UIScreen.main.bounds.size.width
public let BAKit_Define_Frame_ScreenHeight     = UIScreen.main.bounds.size.height
public let BAKit_Define_Frame_Max_Length = max(BAKit_Define_Frame_ScreenWidth, BAKit_Define_Frame_ScreenHeight)
public let BAKit_Define_Frame_Min_Length = min(BAKit_Define_Frame_ScreenWidth, BAKit_Define_Frame_ScreenHeight)

public let BAKit_Define_Frame_NativeBoundsWidth  = UIScreen.main.nativeBounds.size.width
public let BAKit_Define_Frame_NativeBoundsHeight  = UIScreen.main.nativeBounds.size.height
public let BAKit_Define_Frame_StatusBarHeight  = UIApplication.shared.statusBarFrame.height

/**
 *  设备类型
 */
public enum BAKit_DeveiceType : NSInteger{
    case iPad
    case iPhone
    case retina
    case unknown
}

/**
 *  手机型号
 */
public enum BAKit_iPhoneType : NSInteger{
    case BAKit_iPhoneType_iPhone5S //包括 SE, 5S，5C
    case BAKit_iPhoneType_iPhone6 //包括6，6s，7
    case BAKit_iPhoneType_iPhone6P//包括6p，6sp,7p
    case unknowSeries
}

/**
 *  判断设备类型
 */
public func BAKit_deveiceType() -> BAKit_DeveiceType {
    if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad {
        return BAKit_DeveiceType.iPad
    }else if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone {
        return BAKit_DeveiceType.iPhone
    }else if UIScreen.main.scale >= 2.0 {
        return BAKit_DeveiceType.retina
    }else{
        return BAKit_DeveiceType.unknown
    }
}

/**
 *  判断手机类型
 */
public func PhoneType() -> BAKit_iPhoneType{
    if BAKit_deveiceType() == BAKit_DeveiceType.iPhone {
        if  BAKit_Define_Frame_Max_Length == 568.0 {
            return BAKit_iPhoneType.BAKit_iPhoneType_iPhone5S
        }else if  BAKit_Define_Frame_Max_Length == 667.0 {
            return BAKit_iPhoneType.BAKit_iPhoneType_iPhone6
        }else if  BAKit_Define_Frame_Max_Length == 736.0 {
            return BAKit_iPhoneType.BAKit_iPhoneType_iPhone6P
        }else{
            return BAKit_iPhoneType.unknowSeries
        }
    }else {
        return BAKit_iPhoneType.unknowSeries
    }
}

/**
 *  屏幕适配（宽）（以 6 为基准 375*667)
 */
public func BAKit_Define_Frame_ScaleWidth(_ width:CGFloat) -> CGFloat{
    var pixelW = CGFloat()
    let scale = BAKit_Define_Frame_ScreenWidth/375
    pixelW = width * scale
    
    return pixelW
}

/**
 *  屏幕适配（高）（以 6 为基准 375*667)
 */
public func BAKit_Define_Frame_ScaleHeight(_ height:CGFloat) -> CGFloat{
    var pixelH = CGFloat()
    let scale = BAKit_Define_Frame_ScreenHeight/667
    pixelH = height * scale
    
    return pixelH
}

/**
 *  像素适配（宽）（以 6 为基准 750*1334)
 */
public func BAKit_Define_Frame_ScaleWidthPix(_ width:CGFloat) -> CGFloat{
    var pixelW = CGFloat()
    let scale = BAKit_Define_Frame_NativeBoundsWidth/750.0
    pixelW = width * scale
    
    return pixelW
}

/**
 *  像素适配（高）（以 6 为基准 750*1334)
 */
public func BAKit_Define_Frame_ScaleHeightPix(_ height:CGFloat) -> CGFloat{
    var pixelH = CGFloat()
    let scale = BAKit_Define_Frame_NativeBoundsHeight/1334.0
    pixelH = height * scale
    
    return pixelH
}
