//
//  PostModel.swift
//  iOS-Viper-Study
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/21.
//

import Foundation
import ObjectMapper

struct PostModel {
    var id: Int = 0
    var title: String = ""
    var imageUrl: String = ""
    var thumbImageUrl: String = ""
    var detail: String = ""
}


extension PostModel: Mappable {
    init?(map: ObjectMapper.Map) {
    }
    
    mutating func mapping(map: ObjectMapper.Map) {
        id <- map["id"]
        title <- map["title"]
        imageUrl <- map["imageUrl"]
        thumbImageUrl <- map["thumbImageUrl"]
        detail <- map["detail"]
    }
}
