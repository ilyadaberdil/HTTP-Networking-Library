
//
//  SamplePostRepo.swift
//  ServiceRepository
//
//  Created by Berdil İlyada Karacam on 22.06.2019.
//  Copyright © 2019 Berdil İlyada Karacam. All rights reserved.
//

import Foundation
import ServiceCore

public protocol SamplePostRepositoryProtocol {
    func postSampleModel(param: SampleParameter, completionHandler: @escaping (_ response: ServiceResponse<TokenModel>) -> () )
}

public class SamplePostRepository: SamplePostRepositoryProtocol {
    public func postSampleModel(param: SampleParameter, completionHandler: @escaping (ServiceResponse<TokenModel>) -> ()) {
        BaseService.postMethod(url: "https://reqres.in/api/login", param: param, completionHandler: completionHandler)
    }
    
    public init() { }
    
}
