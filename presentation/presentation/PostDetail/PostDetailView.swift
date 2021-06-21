//
//  PostDetailView.swift
//  presentation
//
//  Created by Gabriel Palhares on 20/06/21.
//

import SwiftUI

struct PostDetailView: View {
    
    @ObservedObject public var postDetailVM: PostDetailVM
    
    public init(postDetailVM: PostDetailVM) {

        self.postDetailVM = postDetailVM
    }
    
    var body: some View {
        Text(postDetailVM.details)
    }
}
