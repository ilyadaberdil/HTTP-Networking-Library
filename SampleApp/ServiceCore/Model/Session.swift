//
//  Session.swift
//  ServiceCore
//
//  Created by Berdil İlyada Karacam on 14.06.2019.
//  Copyright © 2019 Berdil İlyada Karacam. All rights reserved.
//

import Foundation

public struct Session {
    public static var shared: URLSession {
      return URLSession.shared
    }
}
