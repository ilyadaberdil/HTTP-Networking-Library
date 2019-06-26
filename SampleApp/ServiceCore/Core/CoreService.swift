//
//  CoreService.swift
//  ServiceCore
//
//  Created by Berdil İlyada Karacam on 14.06.2019.
//  Copyright © 2019 Berdil İlyada Karacam. All rights reserved.
//

import Foundation

public struct CoreVoid: Codable {
    
}

protocol CoreService {
    static func execute<T, U: Codable>(method: HttpMethod<U>, completionHandler:  @escaping (_ response: ServiceResponse<T>) -> ()) where T : Decodable, T : Encodable
}

extension CoreService {

    static func execute<T, U: Codable>(method: HttpMethod<U>, completionHandler: @escaping (_ response: ServiceResponse<T>) -> () ) where T : Decodable, T : Encodable {
        
        func createURL(url: String) throws -> URL {
            guard let url = URL(string: url) else {
                throw ErrorType.urlException.withLog()
            }
            return url
        }
        
        func createPostRequest<T: Codable>(url: String, param: T?, cachePolicy: NSURLRequest.CachePolicy = .useProtocolCachePolicy, timeoutInterval: TimeInterval = 60) throws ->  URLRequest? {
            let serviceURL = try createURL(url: url)
            var request = URLRequest.init(url: serviceURL, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            let jsonData = try JSONEncoder().encode(param)
            request.httpBody = jsonData
            LogTrackingHelper.log(for: jsonData)
            LogTrackingHelper.log(for: request)
            return request
        }
        
        func createGetRequest(url: String, cachePolicy: NSURLRequest.CachePolicy = .useProtocolCachePolicy, timeoutInterval: TimeInterval = 60) throws ->  URLRequest? {
            let serviceURL = try createURL(url: url)
            var request = URLRequest.init(url: serviceURL, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval)
            request.httpMethod = "GET"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            LogTrackingHelper.log(for: serviceURL)
            return request
        }
        
        let session = Session.shared

        var request: URLRequest?
        
        switch method {
        case .get(let url):
            do {
                request = try createGetRequest(url: url)
            } catch (let error) {
                completionHandler(.failure(error))
                return
            }
        case let .post(url: url, param: param):
            do {
                request = try createPostRequest(url: url, param: param)
            } catch (let error) {
                completionHandler(.failure(error))
                return
            }
        }
        
        guard let serviceRequest = request else {
            completionHandler(.failure(ErrorType.requestException.withLog()))
            return
        }
        
        session.dataTask(with: serviceRequest) { (data, response, error) in
            guard let serviceData = data else {
                LogTrackingHelper.log(for: error)
                completionHandler(ServiceResponse.failure(error))
                return
            }
            LogTrackingHelper.log(for: serviceData)
            LogTrackingHelper.log(for: response)
            do {
                let result = try JSONDecoder().decode(T.self, from: serviceData)
                completionHandler(ServiceResponse.success(result))
            } catch let error {
                LogTrackingHelper.log(for: error)
                completionHandler(ServiceResponse.failure(error))
            }
            }.resume()
    }
}

