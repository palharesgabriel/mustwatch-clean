//
//  PostDetailVM.swift
//  presentation
//
//  Created by Gabriel Palhares on 20/06/21.
//

import Foundation

public class PostDetailVM: ObservableObject {
    
    @Published var details = "My details"
    
    // So we can initialize it from the app layer
    public init() { }
}
