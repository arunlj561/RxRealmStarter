//
//	Group.swift
//  Vovo
//	Create by Arun Jangid on 25/2/2017
//	Copyright © 2017. All rights reserved.
//

import Foundation 
import ObjectMapper
import RealmSwift
import Realm


class Group : Object, Mappable{

	dynamic var groupId : String?
	dynamic var groupName : String?
	dynamic var profilePhoto : String?
    dynamic var type : String?
	dynamic var userId : String?
    dynamic var groupPhoto : String?
     var members = List<GroupMember>()


    override static func primaryKey() -> String? {
        return "groupId"
    }
	class func newInstance(map: Map) -> Mappable?{
		return Group()
	}
	required init?(map: Map){
        super.init()
    }
	internal required init(){
        super.init()
    }

	func mapping(map: Map)
	{
		groupId <- map["GroupId"]
		groupName <- map["GroupName"]
		profilePhoto <- map["ProfilePhoto"]
		type <- map["Type"]
		userId <- map["UserId"]
        groupId <- map["GroupId"]
        groupName <- map["GroupName"]
        groupPhoto <- map["GroupPhoto"]
        members <- (map["Members"], ArrayTransform<GroupMember>())
	}

    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }

    
    
    
}

import UIKit
import RealmSwift
import ObjectMapper


class ArrayTransform<T:RealmSwift.Object> : TransformType where T:Mappable {
    typealias Object = List<T>
    typealias JSON = Array<AnyObject>
    
    func transformFromJSON(_ value: Any?) -> List<T>? {
        let realmList = List<T>()
        
        if let jsonArray = value as? Array<Any> {
            for item in jsonArray {
                if let realmModel = Mapper<T>().map(JSONObject: item) {
                    realmList.append(realmModel)
                }
            }
        }
        
        return realmList
    }
    
    func transformToJSON(_ value: List<T>?) -> Array<AnyObject>? {
        
        guard let realmList = value, realmList.count > 0 else { return nil }
        
        var resultArray = Array<T>()
        
        for entry in realmList {
            resultArray.append(entry)
        }
        
        return resultArray
    }
}
