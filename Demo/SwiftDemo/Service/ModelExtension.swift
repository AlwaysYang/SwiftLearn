//
//  ModelExtension.swift
//  SwiftDemo
//
//  Created by zws on 2018/1/31.
//  Copyright © 2018年 MAF. All rights reserved.
//

import Foundation

import RxSwift
import Moya
import ObjectMapper

extension Observable{
    func mapObject<T:Mappable>(type:T.Type) -> Observable<T>{
    
        return self.map({ (response) in
            guard let dict = response as? [String : Any] else{
                throw MoyaError.jsonMapping(response as! Response)
            }
            return Mapper<T>().map(JSON: dict)!
        })
        
    }
    
    func mapArray<T: Mappable>(type: T.Type) -> Observable<[T]> {
        return self.map { response in
            //if response is an array of dictionaries, then use ObjectMapper to map the dictionary
            //if not, throw an error
            guard let array = response as? [Any] else {
                throw MoyaError.jsonMapping(response as! Response)
            }
            
            guard let dicts = array as? [[String: Any]] else {
                throw MoyaError.jsonMapping(response as! Response)
            }
            
            return Mapper<T>().mapArray(JSONArray: dicts)
        }
    }
}
