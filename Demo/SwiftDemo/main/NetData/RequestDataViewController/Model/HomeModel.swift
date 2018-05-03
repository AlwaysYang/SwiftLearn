//
//  HomeModel.swift
//  SwiftDemo
//
//  Created by zws on 2018/1/30.
//  Copyright © 2018年 MAF. All rights reserved.
//

import UIKit
import ObjectMapper

class HomeModel: Mappable {
    
    var date: String?
    var stories: [StoryModel]?
    var top_stories: [StoryModel]?
    
    required init?(map:Map){
        
    }
    
    //
    public func mapping(map: Map) {
        date <- map["date"]
        stories <- map["stories"]
        top_stories <- map["top_stories"]
    }

}

class StoryModel: Mappable {
    var ga_prefix: String?
    var id: Int?
    var images: [String]?
    var title: String?
    var type: Int?
    var image: String?
    var multipic = false
    
    required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        
        ga_prefix <- map["ga_prefix"]
        id <- map["id"]
        images <- map["images"]
        title <- map["title"]
        type <- map["type"]
        image <- map["image"]
        multipic <- map["multipic"]
        
    }
    
    
    
}
