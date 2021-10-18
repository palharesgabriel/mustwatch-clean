//
//  PostDataRemoteMock.swift
//  dataTests
//
//  Created by Gabriel Palhares on 17/10/21.
//

import Foundation
@testable import data

class PostDataRemoteMock: PostRemoteDataSourceInterface {
    
    private var numberOfPosts: Int
    private var samplePost: PostModel
    
    convenience init(numbersOfPosts: Int, samplePost: PostModel) {
        self.init(urlString: .init(), coder: Coder())
        self.numberOfPosts = numbersOfPosts
        self.samplePost = samplePost
    }
    
    required init(urlString: String, coder: Coder, session: URLSession = .shared) {
        numberOfPosts = .init()
        samplePost = PostModel(userId: nil, id: nil, title: nil, body: .init())
    }
    
    func getPosts(handler: @escaping ([PostModel]) -> ()) {
        
        var posts: [PostModel] = .init()
        
        for _ in 0..<numberOfPosts {
            posts.append(samplePost)
        }
        
        handler(posts)
    }
}
