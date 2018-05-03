//
//  UserDefaults_BAKit.swift
//  yunLianApp
//
//  Created by boai on 2018/1/10.
//  Copyright © 2018年 云联惠. All rights reserved.
//

import Foundation

public extension UserDefaults {
    //1
    func ba_userDefaultsSaveCustomObject(customObject object: String, key: String) {
        //2
        let encodedObject = NSKeyedArchiver.archivedData(withRootObject: object)
        self.set(encodedObject, forKey: key)
        self.synchronize()
        
        // 1、获得沙盒的根路径
//        let docPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] as NSString
//
//        // 3、获取文本文件路径
//        let filePath = docPath.appendingPathComponent("data.plist")
//
//        // 4、将数据写入文件中
//        NSKeyedArchiver.archiveRootObject(object, toFile: filePath)
    }
    
    func ba_userDefaultsGetCustomObject(forKey key: String) -> String? {
        
        let decodedObject = self.object(forKey: key) as? NSData
        
        if let decoded = decodedObject {
            let object = NSKeyedUnarchiver.unarchiveObject(with: decoded as Data)
            return object as? String
        }
        
        return ""
        
//        /// 1、获得沙盒的根路径
//        let home = NSHomeDirectory() as NSString;
//        /// 2、获得Documents路径，使用NSString对象的stringByAppendingPathComponent()方法拼接路径
//        let docPath = home.appendingPathComponent("Documents") as NSString;
//        /// 3、获取文本文件路径
//        let filePath = docPath.appendingPathComponent("data.plist");
//        let dataSource = NSKeyedUnarchiver.unarchiveObject(withFile: filePath);
//        print("存储结果：", dataSource);
//
//        return dataSource as AnyObject


    }
    
    func ba_userDefaultsClearAllUserDefaultsData() -> Void {
        
        /**
         *  清除所有的存储本地的数据
         */
//        let dict:[String : Any] = UserDefaults.standard.dictionaryRepresentation()
//
//        for var item:String in dict {
//            [UserDefaults.standard .removeObject(forKey: item)]
//        }
//
//        UserDefaults.standard.synchronize()
        
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        
//        NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
//        [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
    }
}


