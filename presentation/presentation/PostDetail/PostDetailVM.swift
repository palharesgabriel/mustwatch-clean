//
//  PostDetailVM.swift
//  presentation
//
//  Created by Gabriel Palhares on 20/06/21.
//

import Foundation

public class PostDetailVM: ObservableObject {
    
    @Published var details = "My details"
    @Published var description: String
    
    // Modificador público que permite a inicialização a partir da App layer
    public init(description: String) {
        self.description = description
    }
}
