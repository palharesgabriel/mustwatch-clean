//
//  PostDomainRepoMock.swift
//  domainTests
//
//  Created by Gabriel Palhares on 18/10/21.
//

import Foundation
import domain

struct PostDomainRepoMock: PostDomainRepoInterface {
    
    private let numberOfPosts: Int
    private let samplePost: PostEntity
    
    init(numberOfPosts: Int, samplePost: PostEntity) {
        self.numberOfPosts = numberOfPosts
        self.samplePost = samplePost
    }
    
    func getPosts(handler: @escaping ([PostEntity]) -> ()) {
        var posts: [PostEntity] = .init()
        
        for _ in 0..<numberOfPosts {
            posts.append(samplePost)
        }
        
        handler(posts)
    }
}
