//
//  PostView.swift
//  presentation
//
//  Created by Gabriel Palhares on 18/06/21.
//

import SwiftUI

struct PostView: View {
    
    @ObservedObject var postVM: PostVM
    
    public var body: some View {
        
        NavigationView {
            List {
                ForEach(postVM.posts) { post in
                    VStack{
                        Text(post.title ?? "")
                            .font(.largeTitle)
                            .multilineTextAlignment(.center)
                        
                        Text(post.body )
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
