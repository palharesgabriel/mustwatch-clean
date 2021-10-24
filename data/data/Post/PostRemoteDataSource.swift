//
//  PostRemoteDataSource.swift
//  data
//
//  Created by Gabriel Palhares on 18/06/21.
//

import Foundation
import domain

public protocol PostRemoteDataSourceProtocol {
    
    init(urlString: String, coder: Coder, session: URLSession)
    
    func getPosts(handler: @escaping ([PostModel]) -> ())
}


public class PostRemoteDataSource: PostRemoteDataSourceProtocol {
    
    private let urlString: String
    private let coder: Coder
    private let session: URLSession
    
    required public init(urlString: String,
                         coder: Coder = Coder(),
                         session: URLSession = .shared) {
        self.urlString = urlString
        self.coder = coder
        self.session = session
    }
    
    public func getPosts(handler: @escaping ([PostModel]) -> ()) {
        
        guard let url = URL(string: urlString) else {
            return handler([])
        }
        
        let task = session.dataTask(with: url) { [weak self] (data, urlResponse, error) in
            
            guard let data = data else {
                return handler([])
            }
            
            guard let postModels = self?.coder.decode(toType: [PostModel].self, from: data) else {
                return handler([])
            }
            
            handler(postModels)
        }
        task.resume()
        
    }
}
