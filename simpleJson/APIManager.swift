//
//  APIManager.swift
//  simpleJson
//
//  Created by manish on 23/01/18.
//  Copyright © 2018 manish. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIManager {
    
    func getUserData(onCompletion:@escaping (JSON)-> Void) {
        Alamofire.request("https://jsonplaceholder.typicode.com/users").responseJSON { response in
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                let response = JSON(data)
                onCompletion(response)
            } else {
                onCompletion(nil)
            }
        }
    }
}
