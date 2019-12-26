//
//  NSString+BAKit.swift
//  yunLianApp
//
//  Created by boai on 2018/1/3.
//  Copyright © 2018年 云联惠. All rights reserved.
//

import Foundation
import UIKit
public func BAKit_StringIsEmpty(string : String?) -> Bool {
//    if ((string?.count) != 0)
    if (!(string ?? "").isEmpty)
    {
        return false
    }
    else
    {
        return true
    }
}

public func ba_dataToDictionary(data:Data) -> NSDictionary?{
    do{
        let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
        let dic = json as!NSDictionary
        return dic
    }catch{
        print("失败")
        return nil
    }
}

public func ba_getJSONStringFromDictionary(dictionary:NSDictionary) -> String? {
    if (!JSONSerialization.isValidJSONObject(dictionary)) {
        print("无法解析出JSONString")
        return ""
    }
    let data : NSData! = try? JSONSerialization.data(withJSONObject: dictionary, options: []) as NSData?
    let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
    return JSONString! as String
    
}

/**
 获取文字 size，根据字体大小
 
 @param maxSize 最大的 size
 @param fontSize 字体大小
 @return 文字 size
 */
public func ba_stringGetSizeWithMaxSizeAndFont(string:String,maxSize:CGSize,fontSize:UIFont) ->CGSize{
    
    if string.count == 0{
        return CGSize(width:0,height:0)
    }
    
    let attributes:NSDictionary = NSDictionary(object:fontSize,
                                               forKey:NSAttributedString.Key.font as NSCopying)
    let size = string.boundingRect(with: maxSize,
                                   options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                                attributes:attributes as? [NSAttributedString.Key : AnyObject] ,
                                                context: nil).size
    return size
}

/**
 获取文字 改变部分字体颜色，根据字体颜色
 
 @param allString 全部文字
 @param changeColorString 待改变字体的颜色
 @param color 需要改变的颜色

 @return 文字
 */

public func ba_stringGetAttributedString(allString:String, changeColorString:String, hilightColor:UIColor) -> NSMutableAttributedString{
    
    let attribStr = NSMutableAttributedString.init(string: allString)
    let range:NSRange = (allString as NSString).range(of: changeColorString)
    attribStr.addAttribute(NSAttributedString.Key.foregroundColor, value: hilightColor, range: range)
    return attribStr
}



