//
//  PostInteractor.swift
//  domain
//
//  Created by Gabriel Palhares on 18/06/21.
//

import Foundation

public protocol PostInteractorProtocol {
        
    func getPosts(handler: @escaping ([PostEntity]) -> ())
    
}

public class PostInteractor: PostInteractorProtocol {
        
    let postDomainRepo: PostDomainRepoProtocol
    let kForbiddenWords: [String] = ["Abacaxi", "Banana", "Pimenta"]
    
    public init(postDomainRepo: PostDomainRepoProtocol) {
        
        self.postDomainRepo = postDomainRepo
    }
    
    
    public func getPosts(handler: @escaping ([PostEntity]) -> ()) {
        
        // Aqui é onde implementamos nossas regras, como checar conteúdo de posts e etc
        
        postDomainRepo.getPosts { (PostDomainModelArray) in
            let cleanPosts = self.clearForbiddenWords(PostDomainModelArray)
            handler(cleanPosts)
        }
    }
    
    private func clearForbiddenWords(_ posts: [PostEntity]) -> [PostEntity] {
        posts.map { post in
            
            guard let title = post.title else { return post }
            
            let words = title.components(separatedBy: " ")
            
            let forbiddenWordsFounded = words.filter { kForbiddenWords.contains($0) }
            
            if !forbiddenWordsFounded.isEmpty {
                post.set(title: "*****")
            }
            
            return post
        }
    }
}
