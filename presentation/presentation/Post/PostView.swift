//
//  PostView.swift
//  presentation
//
//  Created by Gabriel Palhares on 18/06/21.
//

import SwiftUI

public struct PostView: View {
    
    var appDI: AppDIProtocol
    
    @State var currentDescription: String = .init()
    
    @ObservedObject public var postVM: PostVM
        
    public init(appDI: AppDIProtocol, postVM: PostVM) {
        self.appDI = appDI
        self.postVM = postVM
    }
    
    public var body: some View {
        NavigationView {
            List(postVM.posts) { post in
                NavigationLink(destination: PostDetailView(appDI: appDI, description: post.body)) {
                    VStack {
                        Text(post.title ?? "")
                            .font(.largeTitle)
                            .multilineTextAlignment(.center)
                        
                        Text(post.body)
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                }
            }
            .navigationBarTitle("Posts")
        }
        
        .onAppear {
            self.postVM.getPosts()
        }
    }
}
