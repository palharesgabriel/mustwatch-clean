//
//  PostInteractorTests.swift
//  domainTests
//
//  Created by Gabriel Palhares on 18/10/21.
//

import XCTest
@testable import domain

class PostInteractorTests: XCTestCase {
    
    func testExample() {
        // Given
        let postEntity = PostEntity(userId: 1,
                                    id: 1,
                                    title: "Título fake para testes",
                                    body: "Descrição fake para testes")
        
        let postDomainRepoMock = PostDomainRepoMock(numberOfPosts: 3, samplePost: postEntity)
        let sut = PostInteractor(postDomainRepo: postDomainRepoMock)
        
        // When
        sut.getPosts { posts in
            // Then
            XCTAssertEqual(posts.count, 3)
            XCTAssertEqual(posts.first?.title, "Título fake para testes")
            XCTAssertEqual(posts.first?.body, "Descrição fake para testes")
        }
    }
    
    func testClearForbiddenWords() {
        // Given
        let postEntity = PostEntity(userId: 1,
                                    id: 1,
                                    title: "Abacaxi é muito bom",
                                    body: "Descrição fake para testes")
        
        let postDomainRepoMock = PostDomainRepoMock(numberOfPosts: 1, samplePost: postEntity)
        let sut = PostInteractor(postDomainRepo: postDomainRepoMock)
        
        // When
        sut.getPosts { posts in
            // Then
            XCTAssertEqual(posts.first?.title, "*****")
        }
    }
    
}
