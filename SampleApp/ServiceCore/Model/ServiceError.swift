//
//  ServiceError.swift
//  ServiceCore
//
//  Created by Berdil İlyada Karacam on 15.06.2019.
//  Copyright © 2019 Berdil İlyada Karacam. All rights reserved.
//

import Foundation

public enum ErrorType: Error {
    case urlException
    case requestException
    
    func withLog() -> ErrorType {
        switch self {
        case .requestException:
            LogTrackingHelper.requestException()
            return .requestException
        case .urlException:
            LogTrackingHelper.urlException()
            return .urlException
        }
    }
}
