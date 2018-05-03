//
//  Date_BAKit.swift
//  yunLianApp
//
//  Created by boai on 2018/1/17.
//  Copyright © 2018年 云联惠. All rights reserved.
//

import Foundation


extension Date{
    public func stringWithFormat (fmtString:String) -> String{
        if BAKit_StringIsEmpty(string: fmtString){
            return ""
        }
        let fmtter: DateFormatter = DateFormatter()
        fmtter.dateFormat = fmtString
        return fmtter.string(from: self)
    }
    
    
    /// 获取n天后日期
    ///
    /// - Parameter day: day
    /// - Returns: newDate
    public func afterDate (day:NSInteger) -> Date{
        let calendar = Calendar(identifier: .gregorian)
        return calendar.date(byAdding: .day, value: day, to: self)!
    }
    
    
}

