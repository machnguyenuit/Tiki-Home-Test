
//
//  Constant.swift
//  Tiki-HotKeyword
//
//  Created by Apple on 5/16/19.
//  Copyright © 2019 nguyenmach. All rights reserved.
//

import UIKit
import ObjectMapper

class ResponseDataKeywordList: Mappable {
    
    var message:String?
    var status:Int?
    var keywords: [KeywordModel]?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        message <- map["message"]
        status <- map["status"]
        keywords <- map["keywords"]
    }
}
