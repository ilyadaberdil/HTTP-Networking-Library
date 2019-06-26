
//
//  SampleGetRepo.swift
//  ServiceRepository
//
//  Created by Berdil İlyada Karacam on 22.06.2019.
//  Copyright © 2019 Berdil İlyada Karacam. All rights reserved.
//

import Foundation
import ServiceCore


public protocol SampleGetRepositoryProtocol {
    func getSampleModel(url: String, completionHandler: @escaping (ServiceResponse<SampleModel>) -> ())
}

public class SampleGetRepository: SampleGetRepositoryProtocol {
    public func getSampleModel(url: String, completionHandler: @escaping (ServiceResponse<SampleModel>) -> ()) {
        BaseService.getMethod(url: url, completionHandler: completionHandler)
    }
    
    public init() { }
    
}

