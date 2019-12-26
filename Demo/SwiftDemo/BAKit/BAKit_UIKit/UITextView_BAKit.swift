//
//  UITextView_BAKit.swift
//  yunLianApp
//
//  Created by boai on 2018/1/12.
//  Copyright © 2018年 云联惠. All rights reserved.
//

import Foundation
import UIKit

extension UITextView {
    //添加链接文本（链接为空时则表示普通文本）
    func ba_textViewAppendLinkString(string:String, withURLString:String = "", hilightTextColor:UIColor?) {
        //原来的文本内容
        let attrString:NSMutableAttributedString = NSMutableAttributedString()
        attrString.append(self.attributedText)
        
        //新增的文本内容（使用默认设置的字体样式）
        let attrs = [NSAttributedString.Key.font : self.font!]
        let appendString = NSMutableAttributedString(string: string, attributes:attrs)
        
        //判断是否是链接文字
        if withURLString != "" {
            let range:NSRange = NSMakeRange(0, appendString.length)
            appendString.beginEditing()
            appendString.addAttribute(NSAttributedString.Key.link, value:withURLString, range:range)

            appendString.endEditing()
        }
        //合并新的文本
        attrString.append(appendString)
        
        self.linkTextAttributes = [NSAttributedString.Key.foregroundColor:hilightTextColor ?? UIColor.blue]

        //设置合并后的文本
        self.attributedText = attrString
    }
}
