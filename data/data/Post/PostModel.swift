//
//  PostModel.swift
//  data
//
//  Created by Gabriel Palhares on 18/06/21.
//

import Foundation
import domain

public struct PostModel: Codable {
    
    public let userId: Int?
    public let id: Int?
    public let title: String?
    public let body: String
    
    
    // DOT: Data Object Transfer
    public func dotPostEntity() -> PostEntity {
        return PostEntity(userId: userId, id: id, title: title, body: body)
    }
}
