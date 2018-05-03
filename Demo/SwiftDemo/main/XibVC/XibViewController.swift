//
//  XibViewController.swift
//  SwiftDemo
//
//  Created by zws on 2018/1/30.
//  Copyright © 2018年 MAF. All rights reserved.
//

import UIKit
import Kingfisher

typealias completeBlock = () -> ()

class XibViewController: BaseViewController_BAKit {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var tf: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    var btnActionBlock :completeBlock?
    

    
    //#MARK:- IBAction
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        print(sender)
        if (btnActionBlock != nil) {
            btnActionBlock!();
        }
    }
    @IBAction func textChanged(_ sender: UITextField) {
        print(sender.text ?? "noting")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imageView.kf.setImage(with: URL(string: "http://img07.tooopen.com/images/20170410/tooopen_sy_205363675636.jpg"))
        
        self.navigationItem.title = NSStringFromClass(XibViewController.self)
        
        _ = tf.rx.text.subscribe(onNext: { (text) in
            print(text ?? "")
        })
        
        

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
