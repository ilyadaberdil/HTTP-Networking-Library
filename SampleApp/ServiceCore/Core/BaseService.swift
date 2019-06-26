//
//  BaseService.swift
//  ServiceCore
//
//  Created by Berdil İlyada Karacam on 14.06.2019.
//  Copyright © 2019 Berdil İlyada Karacam. All rights reserved.
//

import Foundation


public class BaseService: CoreService {

    public static func getMethod<T: Codable>(url: String, completionHandler:  @escaping (_ response: ServiceResponse<T>) -> () ) {
        execute(method: HttpMethod<CoreVoid>.get(url: url), completionHandler: completionHandler)
    }
    
    public static func postMethod<T: Codable, U: Codable>(url: String, param: U? = nil, completionHandler:  @escaping (_ response: ServiceResponse<T>) -> ()) {
        if let _ = param {
            execute(method: .post(url: url, param: param), completionHandler: completionHandler)
        } else {
            let voidParam = CoreVoid()
            execute(method: .post(url: url, param: voidParam), completionHandler: completionHandler)
        }
    }
}

