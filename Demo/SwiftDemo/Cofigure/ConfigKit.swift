//
//  ConfigKit.swift
//  SwiftDemo
//
//  Created by zws on 2018/2/1.
//  Copyright © 2018年 MAF. All rights reserved.
//

import Foundation
import UIKit

class ConfigKit: NSObject {
    static let kit = ConfigKit()
    // 重载并私有(禁止访问init)
    private override init() {
        // 初始化一些内容
    }
    
    
    func configAppStyle(){
        //导航栏颜色
        UINavigationBar.appearance().barTintColor = UIColor.white
        //导航栏字体
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 19), NSAttributedString.Key.foregroundColor: MAINTHEMECOLOR]
        //导航栏按钮颜色
        UINavigationBar.appearance().tintColor = MAINTHEMECOLOR
        UIApplication.shared.setStatusBarHidden(true, with: .none)
        UIApplication.shared.setStatusBarHidden(false, with: .none)
        
    }
    
}

