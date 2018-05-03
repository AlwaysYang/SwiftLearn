//
//  BaseViewController_BAKit.swift
//  SwiftDemo
//
//  Created by zws on 2018/1/29.
//  Copyright © 2018年 MAF. All rights reserved.
//

import UIKit

class BaseViewController_BAKit: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if self.responds(to: #selector(getter: edgesForExtendedLayout)) {
            self.edgesForExtendedLayout = []
        }
        self.view.backgroundColor = UIColor.white
        
        // 返回按钮
        let title = "返回"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: nil, action: nil)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
