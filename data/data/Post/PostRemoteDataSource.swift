//
//  PostRemoteDataSource.swift
//  data
//
//  Created by Gabriel Palhares on 18/06/21.
//

import Foundation
import domain

public protocol PostRemoteDataSourceInterface {
    
    init(urlString: String, coder: Coder)
    
    func getPosts(handler: @escaping ([PostModel]) -> ())
}


public class PostRemoteDataSource: PostRemoteDataSourceInterface {
    
    let urlString: String
    let coder: Coder
    
    required public init(urlString: String, coder: Coder = Coder()) {
        self.urlString = urlString
        self.coder = coder
    }
    
    public func getPosts(handler: @escaping ([PostModel]) -> ()) {
        
        guard let url = URL(string: urlString) else {
            return handler([])
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, urlResponse, error) in
            
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
