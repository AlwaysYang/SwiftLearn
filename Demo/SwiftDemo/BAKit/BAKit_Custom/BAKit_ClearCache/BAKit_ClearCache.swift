//
//  BAKit_ClearCache.swift
//  yunLianApp
//
//  Created by boai on 2018/1/18.
//  Copyright © 2018年 云联惠. All rights reserved.
//

import Foundation
import UIKit
// MARK: - 计算缓存文件大小

/// 计算缓存文件大小
///
/// - Returns: 缓存文件大小
public func ba_clearCacheGetFileSizeOfCache()-> CGFloat {
    
    // 取出cache文件夹目录 缓存文件都在这个目录下
    let cachePath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first
    //缓存目录路径
    // 取出文件夹下所有文件数组
    let fileArr = FileManager.default.subpaths(atPath: cachePath!)
    //快速枚举出所有文件名 计算文件大小
    var size:CGFloat = 0.0
    for file in fileArr! {
        // 把文件名拼接到路径中
        let path = (cachePath! as NSString).appending("/\(file)")
        // 取出文件属性
        let floder = try! FileManager.default.attributesOfItem(atPath: path)
        // 用元组取出文件大小属性
        for (abc, bcd) in floder {
            // 累加文件大小
            if abc == FileAttributeKey.size {
                size += CGFloat(bcd as! CGFloat)
            }
        }
    }
    let mm:CGFloat = size / 1024.0 / 1024.0
    return mm
}

// MARK: - 删除缓存文件

/// 删除缓存文件
public func ba_clearCacheClearCache(complicationBlock:@escaping ()->()) {
    
    // 取出cache文件夹目录 缓存文件都在这个目录下
    let cachePath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first
    // 取出文件夹下所有文件数组
    let fileArr = FileManager.default.subpaths(atPath: cachePath!)
    // 遍历删除
    for file in fileArr! {
        let path = (cachePath! as NSString).appending("/\(file)")
        if FileManager.default.fileExists(atPath: path) {
            do {
                try FileManager.default.removeItem(atPath: path)
                complicationBlock()
            } catch {
                
            }
        }
    }
}

