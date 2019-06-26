//
//  SampleParameter.swift
//  ServiceRepository
//
//  Created by Berdil İlyada Karacam on 22.06.2019.
//  Copyright © 2019 Berdil İlyada Karacam. All rights reserved.
//

import Foundation

public struct SampleParameter: Codable {
    public var email: String?
    public var password: String?
    
    public init(email: String?, password: String?) {
        self.email = email
        self.password = password
    }
}
