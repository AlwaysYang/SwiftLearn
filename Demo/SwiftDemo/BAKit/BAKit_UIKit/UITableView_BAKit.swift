//
//  UITableView_BAKit.swift
//  yunLianApp
//
//  Created by boai on 2018/1/20.
//  Copyright © 2018年 云联惠. All rights reserved.
//

import Foundation

//protocol BAKit_Cell_Reusable : class{
//    static var reuseableIdentifier :String {get}
//    static var nib : UINib? {get}
//}
//
//extension BAKit_Cell_Reusable where Self : UITableViewCell{
//    static var reuseableIdentifier :String{
//        //return "\(self)"
//        //两种实现方式都可以
//        print(" --- \(self)  \(String(describing: self)) --- ")
//        return String(describing: self)
//    }
//    
//    static var nib : UINib? {
//        return nil
//    }
//}
//
//extension UITableView{
//    func registerCell<T : UITableViewCell >(_ cell : T.Type) where T : BAKit_Cell_Reusable{
//        if let nib  = T.nib{
//            register(nib, forCellReuseIdentifier: T.reuseableIdentifier)
//        }else{
//            register(cell, forCellReuseIdentifier: T.reuseableIdentifier)
//        }
//    }
//    
//    func dequeReusableCell<T : UITableViewCell>(indexPath : IndexPath) -> T where T : BAKit_Cell_Reusable{
//        return dequeReusableCell(withIdentifier: T.reuseableIdentifier, for: indexPath) as! T
//    }
//}

