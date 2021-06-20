//
//  PostDomainRepoInterface.swift
//  domain
//
//  Created by Gabriel Palhares on 18/06/21.
//

import Foundation

public protocol PostDomainRepoInterface {
    
    func getPosts(handler: @escaping ([PostEntity]) -> ())
    
}
