//
//  PostEntity.swift
//  domain
//
//  Created by Gabriel Palhares on 18/06/21.
//

import Foundation

public class PostEntity: Identifiable {
    
    public let userId: Int?
    public let id: Int?
    public let body: String

    public var title: String?
    
    public init(userId: Int?, id: Int?, title: String?, body: String) {
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
    }
    
    func set(title: String) {
        self.title = title
    }
}
