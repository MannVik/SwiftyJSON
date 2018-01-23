//
//  userModol.swift
//  simpleJson
//
//  Created by manish on 23/01/18.
//  Copyright © 2018 manish. All rights reserved.
//

import Foundation
import SwiftyJSON

class userModol {
    var userId:String?
    var name:String?
    var body:String?
    var add:address?
    
    init(res:JSON) {
        userId = res["id"].stringValue
        name = res["name"].stringValue
        body = res["body"].stringValue
        add = address(address:res["address"])
    }
}

class address {
    var street:String?
    var city:String?
    var geoData:geo?
    
    init(address:JSON) {
        street = address["street"].stringValue
        city = address["city"].stringValue
        geoData = geo(geo:address["geo"])
    }
}

class geo {
    var lat:String?
    var lng:String?
    
    init(geo:JSON) {
        lat = geo["lat"].stringValue
        lng = geo["lng"].stringValue
    }
}


