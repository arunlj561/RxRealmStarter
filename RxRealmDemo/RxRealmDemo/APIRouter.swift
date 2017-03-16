    //
    //  APIRouter.swift
    //  Vovo
    //
    //  Created by Arun Jangid on 2/4/17.
    //  Copyright © 2017 Arun Jangid. All rights reserved.
    //
    
    import Foundation
    import Alamofire
    import AlamofireObjectMapper
    
    enum APIRouter:URLRequestConvertible {
        
        
        // GROUP API
        case createGroup(param :Parameters)
        
        
        
        static let baseURLString = "http://vovoearn.mitroztech.com/api"
        //static let baseURLString = "http://192.168.1.133/VOVO"
        
        var method: HTTPMethod {
            switch self {
            case .createGroup:
                return .post
            
            }
            
        }
        
        var path: String {
            switch self {
            case .createGroup:
                return "/CreateGroup.php"
            
            }
        }
        
        // MARK: URLRequestConvertible
        
        func asURLRequest() throws -> URLRequest {
            let url = try APIRouter.baseURLString.asURL()
            
            var urlRequest = URLRequest(url: url.appendingPathComponent(path))
            urlRequest.httpMethod = method.rawValue
            
            
            
            switch self {
           
            case .createGroup(param: let param):
                urlRequest = try URLEncoding.default.encode(urlRequest, with: param)
        
            default:
                break
            }
            
            return urlRequest
        }
    }
