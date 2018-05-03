//
//  OtherViewController.swift
//  SwiftDemo
//
//  Created by zws on 2018/1/29.
//  Copyright © 2018年 MAF. All rights reserved.
//

import UIKit
import SnapKit

class OtherViewController: BaseViewController_BAKit {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "其他";
        // Do any additional setup after loading the view.
        let btn : UIButton = UIButton();
        btn.backgroundColor = UIColor.blue
        self.view.addSubview(btn)
        btn.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(50)
            make.center.equalTo(self.view.snp.center)
        }
    
        btn.addTarget(self, action: #selector(btnClicked(sender:)), for: .touchUpInside)
    }

    
    
    @objc func btnClicked(sender:UIButton?) {
        //xib
        let xibVC: XibViewController = XibViewController();
        xibVC.btnActionBlock = {
            self.navigationController?.popViewController(animated: true);
        }
        
        self.navigationController?.pushViewController(xibVC, animated: true);
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
