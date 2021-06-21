//
//  PostView.swift
//  presentation
//
//  Created by Gabriel Palhares on 18/06/21.
//

import SwiftUI

public struct PostView: View {
    
    var appDI: AppDIInterface
    @ObservedObject public var postVM: PostVM
    
    @State var detailsIsPresented: Bool = false
    
    public init(appDI: AppDIInterface, postVM: PostVM) {
        self.appDI = appDI
        self.postVM = postVM
    }
    
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
                }.onTapGesture {
                    self.detailsIsPresented = true
                }
            }
            .sheet(isPresented: $detailsIsPresented, content: {
                PostDetailView(postDetailVM: self.appDI.postDetailDependencies())
            })
            .navigationBarTitle("Posts")
        }
            
        .onAppear {
            self.postVM.getPosts()
        }
    }
}
