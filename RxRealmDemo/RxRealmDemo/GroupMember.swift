//
//	GroupMember.swift
//
//	Create by Arun Jangid on 25/2/2017
//	Copyright © 2017. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift
import Realm

class GroupMember : Object, Mappable{
    
    dynamic var contact : String?
    dynamic var status : String?
    dynamic var type : String?
    dynamic var userCode : String?
    dynamic var userName : String?
    dynamic var userPhoto : String?
    dynamic var userRegistrationId : String?
    
    
    class func newInstance(map: Map) -> Mappable?{
        return GroupMember()
    }
    required init?(map: Map){
        super.init()
    }
    internal required init(){
        super.init()
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    func mapping(map: Map)
    {
        contact <- map["Contact"]
        status <- map["Status"]
        type <- map["Type"]
        userCode <- map["UserCode"]
        userName <- map["UserName"]
        userPhoto <- map["UserPhoto"]
        userRegistrationId <- map["UserRegistrationId"]
        
    }
    
    
}
