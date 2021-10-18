//
//  PostDataRepoTests.swift
//  dataTests
//
//  Created by Gabriel Palhares on 17/10/21.
//

import XCTest
@testable import data

class PostDataRepoTests: XCTestCase {
    
    func testExample() {
        // Given
        let dataSourceMock = PostDataRemoteMock(numbersOfPosts: 3, samplePost: PostModel(userId: 1,
                                                                                         id: 1,
                                                                                         title: "Título fake para testes",
                                                                                         body: "Descrição fake para testes"))
        let sut = PostDataRepo(postRemoteDataSource: dataSourceMock)
        
        // When
        sut.getPosts { posts in
            // Then
            XCTAssertEqual(posts.count, 3)
            XCTAssertEqual(posts.first?.title, "Título fake para testes")
            XCTAssertEqual(posts.first?.body, "Descrição fake para testes")
        }
    }
    
}
