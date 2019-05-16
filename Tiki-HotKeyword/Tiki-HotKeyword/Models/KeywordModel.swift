//
//  KeywordModel.swift
//  Tiki-HotKeyword
//
//  Created by Apple on 5/16/19.
//  Copyright © 2019 nguyenmach. All rights reserved.
//

import UIKit
import ObjectMapper

class KeywordModel: NSObject,Mappable {
    
    var keyword:String?
    var icon:String?
    
    required init?(map: Map) {
        super.init()
    }
    
    func mapping(map: Map) {
        keyword <- map["keyword"]
        icon <- map["icon"]
    }
}
