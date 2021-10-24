//
//  PostDomainRepoProtocol.swift
//  domain
//
//  Created by Gabriel Palhares on 18/06/21.
//

import Foundation

public protocol PostDomainRepoProtocol {
    
    func getPosts(handler: @escaping ([PostEntity]) -> ())
    
}
