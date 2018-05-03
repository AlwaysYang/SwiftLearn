//
//  StoryDetailViewController.swift
//  SwiftDemo
//
//  Created by zws on 2018/2/1.
//  Copyright © 2018年 MAF. All rights reserved.
//

import UIKit
import Moya
import RxSwift
import Alamofire

class StoryDetailViewController: BaseViewController_BAKit {
    
    var storyId :String
    var bag : DisposeBag = DisposeBag()
    
    //网络请求工具
    let provider = MoyaProvider<APIManager>(endpointClosure: endpointMapping, manager: defaultAlamofireManager(), plugins: [LLRequestPlugin(),netWorkActivityPlugin])
    
    init(storyId:String){
        self.storyId = storyId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
//        self.provider.rx.request(.PostLolNewsList).asObservable()
//            .filterSuccessfulStatusCodes()
//            .mapJSON()
//            .mapObject(type: StoryModel.self).subscribe(onNext: { (model) in
//                printLog(model)
//            }, onError: { (error) in
//            })
//            .disposed(by:self.bag)
        
        let urlString = "http://qt.qq.com/php_cgi/news/php/varcache_getnews.php?id=12&page=1&plat=ios&version=9678&version=9689"
        Alamofire.request(urlString).response { response in // method defaults to `.get`
            debugPrint(response)
            let json:Dictionary? = try? JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as! [String:Any]
            print("请求结果：\(json as Any)")
        }
        
//        Alamofire.request(urlString, method: .get, parameters: parameters, encoding: JSONEncoding.default)
//            .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
//                print("Progress: \(progress.fractionCompleted)")
//            }
//            .validate { request, response, data in
//                // Custom evaluation closure now includes data (allows you to parse data to dig out error messages if necessary)
//                return .success
//            }
//            .responseJSON { response in
//                debugPrint(response)
//        }

        
        
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
