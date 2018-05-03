//
//  APIManager.swift
//  SwiftDemo
//
//  Created by zws on 2018/1/30.
//  Copyright © 2018年 MAF. All rights reserved.
//

import UIKit
import Moya

enum APIManager {
    case GetHomeList
    case GetHomeDetail(String)
    case PostLolNewsList
    case PostArticleList
}

extension APIManager: TargetType{
  
    /// The target's base `URL`.
    var baseURL: URL {
        switch self {
        case .PostLolNewsList:
            return URL.init(string: "http://qt.qq.com/")!
        case .PostArticleList:
            return URL.init(string: "http://myenss.com:8080/")!
        default:
            return URL.init(string: "http://news-at.zhihu.com/api/")!
        }
    }
    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String {
        switch self {
            
        case .GetHomeList: // 不带参数的请求
            return "4/news/latest"
        
        case .GetHomeDetail(let id):  // 带参数的请求
            return "4/theme/\(id)"
            
        case .PostLolNewsList:
            return "php_cgi/news/php/varcache_getnews.php?id=12"
            
        case .PostArticleList:
            return "j2ovi/servlet/zhu/otherloginServlet"
            
        }
       
    }
    
    var headers: [String: String]? {
        return nil;
    }

    var method: Moya.Method {
        switch self {
        case .PostArticleList:
            return .post
        default:
            return .get
        }
    }

    /// The method used for parameter encoding.
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    /// Provides stub data for use in testing.
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    /// The type of HTTP task to be performed.
    var task: Task {
        
        var parameters:Dictionary<String, Any> = [:]
       
        switch self {
        
        case .PostArticleList:
            parameters = ["action":"shake","type":"app","shake_type":"news"]
        case .PostLolNewsList:
//            "id":12,
            parameters = ["page":1,"plat":"ios","version":9678]
        default: break
           
        }
        
        if !(parameters.isEmpty) {
            return Task.requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
        
        return  .requestPlain
        
    }
    /// Whether or not to perform Alamofire validation. Defaults to `false`.
    var validate: Bool {
        return false
    }
}
