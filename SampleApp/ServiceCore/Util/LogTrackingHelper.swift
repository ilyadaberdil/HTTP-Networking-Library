//
//  ErrorHandler.swift
//  ServiceCore
//
//  Created by Berdil İlyada Karacam on 16.06.2019.
//  Copyright © 2019 Berdil İlyada Karacam. All rights reserved.
//

import Foundation

class LogTrackingHelper {
    
    class func urlException() {
        #if DEBUG
        print("ERROR -> URL EXCEPTION OCCURED!")
        #endif
    }
    
    class func requestException() {
        #if DEBUG
        print("ERROR -> REQUEST EXCEPTION OCCURED!")
        #endif
    }
    
    class func log(for error: Error?) {
        #if DEBUG
        print("ERROR -> \(String(describing: error))")
        #endif
    }
    
    class func log(for data: Data?) {
        #if DEBUG
        guard let data = data else { return }
        let stringLog = String(data: data, encoding: .utf8)
        print("DATA -> \(stringLog ?? "")")
        #endif
    }
    
    class func log(for response: URLResponse?) {
        #if DEBUG
        print("RESPONSE -> \(String(describing: response))")
        #endif
    }
    
    class func log(for url: URL) {
        #if DEBUG
        print("URL -> \(url)")
        #endif
    }
    
    class func log(for request: URLRequest?) {
        #if DEBUG
        print("REQUEST -> \(String(describing: request))")
        #endif
    }
    
}
