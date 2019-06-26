//
//  SampleModelForPost.swift
//  ServiceRepository
//
//  Created by Berdil İlyada Karacam on 22.06.2019.
//  Copyright © 2019 Berdil İlyada Karacam. All rights reserved.
//

import Foundation

public struct SampleModelForPost: Codable {
    public var name: String?
    public var job: String?
    public var id: String?
    public var createdAt: String?
    
    public init(name: String?, job: String?, id: String?, createdAt: String?) {
        self.name = name
        self.job = job
        self.id = id
        self.createdAt = createdAt
    }
    
}

public struct TokenModel: Codable {
    public var token: String?

    public init() { }
}
