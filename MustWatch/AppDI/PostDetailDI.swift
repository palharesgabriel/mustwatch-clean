//
//  PostDetailDI.swift
//  MustWatch
//
//  Created by Gabriel Palhares on 20/06/21.
//

import presentation
import domain
import data

class PostDetailDI {
    
    let appEnvironment: AppEnvironment
    
    init(appEnvironment: AppEnvironment) {
        self.appEnvironment = appEnvironment
    }
    
    func postDetailDependencies(description: String) -> PostDetailVM {
        let postDetailsVM = PostDetailVM(description: description)
        return postDetailsVM
    }
}
