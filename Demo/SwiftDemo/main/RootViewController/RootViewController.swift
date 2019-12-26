//
//  RootViewController.swift
//  SwiftDemo
//
//  Created by zws on 2018/1/5.
//  Copyright © 2018年 MAF. All rights reserved.
//

import UIKit

class RootViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupUI()
        
    }
    
    func setupUI() {
        let home = HomeViewController();
        let other = OtherViewController();
        let homeNav = BaseNavigationViewController(rootViewController: home)
        let otherNav = BaseNavigationViewController(rootViewController: other)
        self.setViewControllers([homeNav,otherNav], animated: false);
        
        let titleArr = ["首页","其他"];
        let iconArr  = ["tabbar_home","tabbar_kf"];
        let iconSeArr  = ["tabbar_home_sele","tabbar_kf_sele"];
        
        for iconItem in iconArr.enumerated() {
            let tabbarItem:UITabBarItem = self.tabBar.items![iconItem.offset]
            tabbarItem.image = UIImage.init(named: iconItem.element )
            //取消渲染
            tabbarItem.selectedImage = UIImage.init(named: iconSeArr[iconItem.offset])?.withRenderingMode(.alwaysOriginal)
            tabbarItem.title = titleArr[iconItem.offset]
        }
        
        //字体颜色
        self.tabBar.tintColor = BAKit_UIColorHex(0x08b6f8)
    }
    
    private func addChildViewController(childControllerName : String,title : String,normalImage : String) {
        
        // 1.获取命名空间
        guard let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] else {
            print("命名空间不存在")
            return
        }
        // 2.通过命名空间和类名转换成类
        let cls : AnyClass? = NSClassFromString((clsName as! String) + "." + childControllerName)
        // swift 中通过Class创建一个对象,必须告诉系统Class的类型
        guard let clsType = cls as? BaseViewController_BAKit.Type else {
            print("无法转换成BaseViewController")
            return
        }
        
        // 3.通过Class创建对象
        let childController = clsType.init()
        
        // 设置TabBar和Nav的标题
        childController.title = title
        childController.tabBarItem.image = UIImage(named: normalImage)
        // 包装导航控制器
        let nav = BaseNavigationViewController(rootViewController: childController)
        self.addChild(nav);
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
