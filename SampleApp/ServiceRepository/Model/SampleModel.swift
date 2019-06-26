//
//  SampleModel.swift
//  ServiceRepository
//
//  Created by Berdil İlyada Karacam on 22.06.2019.
//  Copyright © 2019 Berdil İlyada Karacam. All rights reserved.
//

import Foundation

/* // MARK: Sample JSON
 service url: https://jsonplaceholder.typicode.com/todos/1
 {
 "userId": 1,
 "id": 1,
 "title": "delectus aut autem",
 "completed": false
 }
 */

public struct SampleModel: Codable {
    
    public var userId: Int?
    public var id: Int?
    public var title: String?
    public var completed: Bool?
    
    public init() { }
    
    public init( userId: Int?, id: Int?, title: String?, completed: Bool?) {
        self.userId = userId
        self.id = id
        self.title = title
        self.completed = completed
    }
    
}
