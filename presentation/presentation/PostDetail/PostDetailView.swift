//
//  PostDetailView.swift
//  presentation
//
//  Created by Gabriel Palhares on 20/06/21.
//

import SwiftUI

struct PostDetailView: UIViewRepresentable {
    
    typealias UIViewType = PostDetailUIKitView
    
    private var appDI: AppDIInterface
    private var description: String
    
    public init(appDI: AppDIInterface, description: String) {
        self.appDI = appDI
        self.description = description
    }
    
    func makeUIView(context: Context) -> PostDetailUIKitView {
        let detailView = PostDetailUIKitView(postDetailVM: appDI.postDetailDependencies(description: description))
        return detailView
    }
    
    func updateUIView(_ uiView: PostDetailUIKitView, context: Context) {
        //
    }
        
}
