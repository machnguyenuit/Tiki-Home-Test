
import UIKit
import Alamofire
import ObjectMapper

public class APIError: NSObject {
   var code:BaseAPIService.StatusCode?
   var message:String?
    
    override init() {
        super.init()
    }
    
    required public init(dataResponse: DataResponse<Any>) {
        super.init()
        code = statusCode(in: dataResponse)
        message = errorMessage(for: dataResponse);
    }
    
    public func getMessage() -> String {
        return E(message)
    }
}

fileprivate extension APIError {
    func statusCode(in dataResponse: DataResponse<Any>) -> BaseAPIService.StatusCode? {
        guard let statusCode = dataResponse.response?.statusCode else {
            return nil
        }
        
        return BaseAPIService.StatusCode(rawValue: statusCode)
    }
    
    func errorMessage(for dataResponse: DataResponse<Any>) -> String {
        guard let object = dataResponse.value as? ResponseDictionary else {
            return  "Unknown"
        }
        
        var message = object["ErrorMessage"] as? String
        
        if message == nil {
            if let mes = object["message"] as? String{
                message = mes
            }else if let mes = object["message"] as? ResponseDictionary{
                message = mes["message"] as? String
            }else if  let mesList = object["message"] as? ResponseArray{
                var newMess = ""
                for  mes in mesList{
                    if let mtring = mes as? String{
                        newMess = newMess.appending(mtring)
                    }
                }
                
                if newMess.count > 0{
                    message = newMess
                }
            }
        }
        
        return message ?? "Unknown"
    }
}
