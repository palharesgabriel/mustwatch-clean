//
//  AppDI.swift
//  MustWatch
//
//  Created by Gabriel Palhares on 18/06/21.
//

import Foundation
import presentation


class AppDI: AppDIProtocol {
    
    static let shared = AppDI(appEnvironment: AppEnvironment())
    
    let appEnvironment: AppEnvironment
    
    init(appEnvironment: AppEnvironment) {
        self.appEnvironment = appEnvironment
    }
    
    func postDependencies() -> PostVM {
        let postDI: PostDI = PostDI(appEnvironment: appEnvironment)
        let postVM = postDI.postDependencies()
        return postVM
    }
    
    func postDetailDependencies(description: String) -> PostDetailVM {
        let postDetailsDI: PostDetailDI = PostDetailDI(appEnvironment: appEnvironment)
        let postDetailsVM = postDetailsDI.postDetailDependencies(description: description)
        return postDetailsVM
    }
    
}
