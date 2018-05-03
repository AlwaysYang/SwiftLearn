//
//  HomeViewController.swift
//  SwiftDemo
//
//  Created by zws on 2018/1/5.
//  Copyright © 2018年 MAF. All rights reserved.
//

import UIKit


class HomeViewController: BaseViewController_BAKit {
    //懒加载
    lazy var lab:UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.gray
        return label
    }()
    
    lazy var dataSource:NSMutableArray = {
        let arr = NSMutableArray();
        return arr
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "首页";
        
        let button = UIButton()
        self.view.addSubview(button)
        button.backgroundColor = BAKit_Color_Brown
        
        //约束
        button.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(50)
            make.center.equalTo(self.view.snp.center)
        }
        
        //设置点击响应事件
//        button.addTarget(self, action:#selector(tapped), for:.touchUpInside)
        
        //button 点击事件的 block
        button.ba_buttonActionBlock =  {(sender) -> Void in
            self.tapped(sender)
        }

        //快速弹框
//        let buttonTitleArray = ["取消", "确定"]
//        UIAlertController().ba_alertController(self, title: "提示", message: "message", buttonTitleArray: buttonTitleArray, buttonTitleColorArray: []) { (index, alertController) in
//        }
        
        //快速初始化图片
//        let imageView = UIImageView()
//        imageView.image = BAKit_Define_Common_ImageName("tabbar")
    
        
    }
    
    
    @objc func tapped(_ button:UIButton) {
        print(button)
        //回调
//        let otherVC: OtherViewController = OtherViewController();
//        self.navigationController?.pushViewController(otherVC, animated: true);
//        otherVC.btnActionBlock = {
//            self.navigationController?.popViewController(animated: true);
//        }
        

        
        //网络请求： moya + rxswift + objectM
        let dataVC = RequestDataViewController()
        self.navigationController?.pushViewController(dataVC, animated: true);
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
