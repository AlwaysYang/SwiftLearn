//
//  LLRequestPlugin.swift
//  LLProgramFrameworkSwift
//
//  Created by 奥卡姆 on 2017/9/26.
//  Copyright © 2017年 aokamu. All rights reserved.
//

import Foundation
import Moya
import Result
import SwiftyJSON

// 管理网络状态的插件
let netWorkActivityPlugin = NetworkActivityPlugin { (change,target)  in
    switch(change){
    case .ended:
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    case .began:
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
}


//可以对请求参数做进一步的修改
//private func endpointMapping<Target: TargetType>(target: Target) -> Endpoint<Target> {
//    print("请求连接：\(target.baseURL)\(target.path) \n方法：\(target.method)\n参数：\(String(describing: target.headers)) ")
//    return MoyaProvider.defaultEndpointMapping(for: target)
//}

let endpointMapping = {(target: APIManager) -> Endpoint in
    print("请求连接：\(target.baseURL)\(target.path) \n方法：\(target.method)\n参数：\(String(describing: target.task)) ")
    return MoyaProvider.defaultEndpointMapping(for: target)
}


//设置网络请求超时等
let requestClosure = { (endpoint: Endpoint, closure: (Result<URLRequest, MoyaError>) -> Void)  -> Void in
    do {
        var  urlRequest = try endpoint.urlRequest()
        urlRequest.timeoutInterval = 30.0
        //        urlRequest.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        //        urlRequest.httpShouldHandleCookies = false
        //        closure(.success(urlRequest))
    } catch MoyaError.requestMapping(let url) {
        closure(.failure(MoyaError.requestMapping(url)))
    } catch MoyaError.parameterEncoding(let error) {
        closure(.failure(MoyaError.parameterEncoding(error)))
    } catch {
        closure(.failure(MoyaError.underlying(error, nil)))
    }
    
}

 public final class LLRequestPlugin: PluginType {
    
    /// Called immediately before a request is sent over the network (or stubbed).
    public func willSend(_ request: RequestType, target: TargetType) {
    }
    
    public func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {                
        switch result {
            case .success(let response):
                
                let str =  NSString(data:response.data,encoding: String.Encoding.utf8.rawValue)
                print("请求结果 format：\(String(describing: str))")
                
                let json:Dictionary? = try? (JSONSerialization.jsonObject(with: response.data, options: .allowFragments) as! [String:Any])
                print("请求结果：\(json as Any)")
                
//                let jsonUserJ = try? JSON(data: response.data)
//
//                print(jsonUserJ ?? "nothing")
                
                
                LLProgressHUD.showSuccess("加载成功")
            case .failure:
                LLProgressHUD.showError("加载失败")
                break
        }
        
    }
}










