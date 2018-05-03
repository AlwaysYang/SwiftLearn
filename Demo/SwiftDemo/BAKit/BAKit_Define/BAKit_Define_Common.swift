//
//  BAKit_Define_Common.swift
//  yunLianApp
//
//  Created by boai on 2018/1/9.
//  Copyright © 2018年 云联惠. All rights reserved.
//

import Foundation
import UIKit

/// 快速创建 iamge
///
/// - Parameter imageName: 图片名字
/// - Returns: image
public func BAKit_Define_Common_ImageName(_ imageName:String?) -> UIImage {
    return UIImage.init(named: imageName!)!
}

// MARK: - 存取对象

/// 快速保存对象到本地
///
/// - Parameters:
///   - object: 对象
///   - key: ke'y
public func BAKit_Define_UserDefaults_SaveObject(with object:String, key:String) {
    UserDefaults().ba_userDefaultsSaveCustomObject(customObject: object, key: key)
}

/// 快速取出本地保存的对象
///
/// - Parameter key: ke'y
/// - Returns: 本地保存的对象
public func BAKit_Define_UserDefaults_GetObject(with key:String) -> String? {
    let obj:String = UserDefaults().ba_userDefaultsGetCustomObject(forKey: key)!
    if BAKit_StringIsEmpty(string: obj) {
        return ""
    }
    return obj
}

public func BAKit_Define_UserDefaults_ClearAllDefaults() {
    UserDefaults().ba_userDefaultsClearAllUserDefaultsData()
}

// MARK: - button 圆角

/// 快速将 button 圆角
///
/// - Parameter sender: button
public func ba_buttonWithCornerAllRound(with sender:UIButton) -> Void {
    sender.ba_viewCornerAllRound(cornerRadii: sender.height/2, borderColor: nil, borderWidth: 0)
}

/// 快速将 button 圆角，系统
///
/// - Parameter sender: button
public func ba_buttonWithCornerAllRound_system(with sender:UIButton) -> Void {
    ba_buttonWithCornerAll_system(with: sender, borderColor: nil, borderWidth: 0, cornerRadius: (sender.height)/2)
}

/// 快速将 button 圆角，带边框，颜色
///
/// - Parameters:
///   - sender: button
///   - borderColor: 边框颜色
///   - borderWidth: 边框宽度
public func ba_buttonWithCornerAllRound(with sender:UIButton, borderColor: UIColor, borderWidth: CGFloat) -> Void {
    sender.ba_viewCornerAllRound(cornerRadii: sender.height/2, borderColor: borderColor, borderWidth: borderWidth)
}

/// 快速将 button 圆角，带边框，颜色，系统
///
/// - Parameters:
///   - sender: button
///   - borderColor: 边框颜色
///   - borderWidth: 边框宽度
public func ba_buttonWithCornerAllRound_system(with sender:UIButton, borderColor: UIColor, borderWidth: CGFloat) -> Void {
    ba_buttonWithCornerAll_system(with: sender, borderColor: borderColor, borderWidth: borderWidth, cornerRadius: (sender.height)/2)
}

/// 快速将 button 圆角，带边框，颜色，圆角度，系统
///
/// - Parameters:
///   - sender: button
///   - borderColor: 边框颜色
///   - borderWidth: 边框宽度
public func ba_buttonWithCornerAll_system(with sender:UIButton, borderColor: UIColor?, borderWidth: CGFloat, cornerRadius: CGFloat) -> Void {
    sender.layer.masksToBounds = true
    sender.layer.cornerRadius = cornerRadius
    sender.layer.borderWidth = borderWidth
    sender.layer.borderColor = borderColor?.cgColor
}

// MARK: - GCD 定时器循环操作

private var timer:DispatchSourceTimer?

/// GCD定时器循环操作
///   - timeInterval: 循环间隔时间
///   - handler: 循环事件
public func ba_DispatchTimer_startFirst(with timeInterval: Double, handler:@escaping (DispatchSourceTimer?)->())
{
    timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.main)
    timer?.schedule(deadline: .now(), repeating: timeInterval)
    timer?.setEventHandler {
        DispatchQueue.main.async {
            handler(timer)
        }
    }
    timer?.resume()
}

public func ba_DispatchTimer_stop () {
    timer?.cancel()
    timer = nil
}


/// GCD延时操作
///   - after: 延迟的时间
///   - handler: 事件
public func ba_DispatchAfter(after: Double, handler:@escaping ()->())
{
    DispatchQueue.main.asyncAfter(deadline: .now() + after) {
        handler()
    }
}

/// GCD定时器倒计时⏳
///   - timeInterval: 循环间隔时间
///   - repeatCount: 重复次数
///   - handler: 循环事件, 闭包参数： 1. timer， 2. 剩余执行次数
public func ba_DispatchTimer(timeInterval: Double, repeatCount:Int, handler:@escaping (DispatchSourceTimer?, Int)->())
{
    if repeatCount <= 0 {
        return
    }
    let timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.main)
    var count = repeatCount
    timer.schedule(wallDeadline: .now(), repeating: timeInterval)
    timer.setEventHandler(handler: {
        count -= 1
        DispatchQueue.main.async {
            handler(timer, count)
        }
        if count == 0 {
            timer.cancel()
        }
    })
    timer.resume()
}

// MARK: - alert

public func BAKit_ShowAlertWithMsg(with msg:String, controller:UIViewController) {
    UIAlertController().ba_alertController(controller, title: "提示", message: msg, buttonTitleArray: ["知道了"], buttonTitleColorArray: nil) { (index, alertController) in
    }
}

// MARK: - 系统分享
public func BAKit_Share_System(with title:String?, image:UIImage?, urlString:String?, controller:UIViewController, completionWithItemHandler: @escaping UIActivityViewControllerCompletionWithItemsHandler) -> Void {
    
    //分享的标题
    let share_Title:String = title!
    //分享的图片
    let share_Image:UIImage = image!
    //分享的url
    let share_Url:URL = URL.init(string: urlString!)!
    //在这里呢 如果想分享图片 就把图片添加进去  文字什么的通上
    let share_ActivityItems: [Any] = [share_Title, share_Image, share_Url]
    
    let share_ActivityVC = UIActivityViewController.init(activityItems: share_ActivityItems, applicationActivities: nil)
    // 不出现在活动项目
    share_ActivityVC.excludedActivityTypes = [UIActivityType.print, UIActivityType.copyToPasteboard, UIActivityType.addToReadingList]
    
    controller.present(share_ActivityVC, animated: true, completion: nil)
    // 分享之后的回调
    share_ActivityVC.completionWithItemsHandler = completionWithItemHandler
}


// MARK: - other






