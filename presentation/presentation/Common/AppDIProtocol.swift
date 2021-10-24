//
//  AppDIProtocol.swift
//  presentation
//
//  Created by Gabriel Palhares on 20/06/21.
//

import Foundation

public protocol AppDIProtocol {
    func postDependencies() -> PostVM
    func postDetailDependencies(description: String) -> PostDetailVM
}
