
//  APIHandler.swift
//  Vovo
//
//  Created by Arun Jangid on 2/4/17.
//  Copyright © 2017 Arun Jangid. All rights reserved.
//

import Foundation
import Alamofire

class APIHandler{
    
    
    class func createMyGroup(param: Parameters, withSuccess success:@escaping(_ res:Group) -> ()){
        Manager.sharedInstance.requesrtURLwithKeypathForArray(keypath: "Data", forURL: APIRouter.createGroup(param: param)) { (group:[Group]) in
            success(group.first!)
        }
        
    }
    
    
    // MARK:- EXTRAS 
    class func getStringFromParams<T>(param: T) -> [String:String]{
        
        let  data = ["request":param]
        let res = try? JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
        
        return ["jsondata":String(data: res!, encoding: .utf8)!]
    }
    
    class func getStringFromParamsWithRequest<T>(param: T) -> [String:String]{
        
        
        let res = try? JSONSerialization.data(withJSONObject: param, options: .prettyPrinted)
        
        return ["jsondata":String(data: res!, encoding: .utf8)!]
    }
}
