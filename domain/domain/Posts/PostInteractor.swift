//
//  PostInteractor.swift
//  domain
//
//  Created by Gabriel Palhares on 18/06/21.
//

import Foundation

public protocol PostInteractorInterface {
        
    func getPosts(handler: @escaping ([PostEntity]) -> ())
    
}

public class PostInteractor: PostInteractorInterface {
        
    let postDomainRepo: PostDomainRepoInterface
    
    public init(postDomainRepo: PostDomainRepoInterface) {
        
        self.postDomainRepo = postDomainRepo
    }
    
    
    public func getPosts(handler: @escaping ([PostEntity]) -> ()) {
        
        // Aqui é onde implementamos nossas regras, como checar conteúdo de posts e etc
        
        postDomainRepo.getPosts { (PostDomainModelArray) in
            handler(PostDomainModelArray)
        }
    }
}
