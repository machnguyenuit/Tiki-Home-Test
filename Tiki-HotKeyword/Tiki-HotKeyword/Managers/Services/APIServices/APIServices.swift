//
//  KeywordModel.swift
//  Tiki-HotKeyword
//
//  Created by Apple on 5/16/19.
//  Copyright © 2019 nguyenmach. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import CoreLocation
import CoreData


public typealias ResponseDictionary = [String: Any]
public typealias ResponseArray = [Any]

public func E(_ val: String?) -> String {
  return (val != nil) ? val! : "";
}


extension BaseAPIService {

    @discardableResult
    func getListHotKeyword(callback: @escaping APICallback<ResponseDataKeywordList>) -> APIRequest {
        return request(method: .GET,
                       path: PathRequest.listHotWekword,
                       input: .empty,
                       callback: callback);
    }

}
