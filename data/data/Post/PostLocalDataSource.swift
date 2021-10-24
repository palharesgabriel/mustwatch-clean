//
//  PostLocalDataSource.swift
//  data
//
//  Created by Gabriel Palhares on 18/06/21.
//

import Foundation
import domain

public protocol PostLocalDataSourceProtocol {
    func getCachedPosts(handler: @escaping ([PostEntity]) -> ())
}
