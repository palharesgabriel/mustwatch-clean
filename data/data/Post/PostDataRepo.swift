//
//  PostDataRepo.swift
//  data
//
//  Created by Gabriel Palhares on 18/06/21.
//

import Foundation
import domain


public class PostDataRepo: PostDomainRepoProtocol {
    
    let postRemoteDataSource: PostRemoteDataSourceProtocol
    let postLocalDataSource: PostLocalDataSourceProtocol?
    let coder: Coder
    
    public init(postRemoteDataSource: PostRemoteDataSourceProtocol,
                postLocalDataSource: PostLocalDataSourceProtocol? = nil,
                coder: Coder = Coder()) {
        
        self.postRemoteDataSource = postRemoteDataSource
        self.postLocalDataSource = postLocalDataSource
        
        self.coder = coder
    }
    
    
    public func getPosts(handler: @escaping ([PostEntity]) -> ()) {
        
        postRemoteDataSource.getPosts { (postModels) in
            
            var postEntities = [PostEntity]()
            for postModel in postModels {
                postEntities.append(postModel.dotPostEntity())
            }
            
            handler(postEntities)
        }
    }
}
