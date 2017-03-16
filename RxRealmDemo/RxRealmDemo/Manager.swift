//
//  Manager.swift
//  Vovo
//
//  Created by Arun Jangid on 2/4/17.
//  Copyright © 2017 Arun Jangid. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import AlamofireObjectMapper


class Manager: SessionManager {
    static let sharedInstance: Manager = Manager()
    
    func requestUrl<T:Mappable>(url: URLRequestConvertible, withSuccess success:@escaping (_ response: T) -> ()) {
        
    
        Alamofire.request(url).validate().responseObject { (response :DataResponse<T>) in
        
            guard response.result.isSuccess else{
        
                return
            }
            
                success(response.result.value!)
            
        }
        
     
    }
    
    
    func requesrtURLwithKeypathForArray<T:Mappable>(keypath:String,forURL url:URLRequestConvertible, withSuccess success:@escaping (_ response:[T]) -> () ){
        Alamofire.request(url).responseArray(queue: nil, keyPath: keypath, context: nil) { (response :DataResponse<[T]>) in
            
            guard response.result.isSuccess else{
//
                return
            }
            guard (response.result.value?.first?.toJSON().count)! > 0 else{
//
                return
            }
            
            
                success((response.result.value)!)
            
            
            
        }
    }
    
    
}
