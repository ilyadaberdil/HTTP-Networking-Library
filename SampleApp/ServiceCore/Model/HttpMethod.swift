//
//  HttpMethod.swift
//  ServiceCore
//
//  Created by Berdil İlyada Karacam on 22.06.2019.
//  Copyright © 2019 Berdil İlyada Karacam. All rights reserved.
//

import Foundation

public enum HttpMethod<T: Codable> {
    case get(url: String)
    case post(url: String, param:T?)
}

