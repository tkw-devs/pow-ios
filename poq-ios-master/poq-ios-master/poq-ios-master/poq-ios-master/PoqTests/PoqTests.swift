//
//  PoqTests.swift
//  PoqTests
//
//  Created by Mihai Ionescu on 17/02/2020.
//  Copyright © 2020 Tecknoworks srl. All rights reserved.
//

import XCTest
@testable import Poq

class PoqTests: XCTestCase {
    
    var poqRepository: PoqRepository!

    override func setUp() {
        super.setUp()
        poqRepository = PoqRepository()
    }

    override func tearDown() {
        poqRepository = nil
        super.tearDown()
    }

    func testInitPoqRepository() {
        // given
        // nothing
        
        // when
        // Initialize PoqRepository
        
        // then
        XCTAssertFalse(poqRepository.loading, "Loading flag not properly initialized")
        XCTAssertFalse(poqRepository.hasError, "Error flag not properly initialized")
        XCTAssertNotNil(poqRepository.repositories, "Repositoriy list not properly initialized")
    }
    
    func testGetRepositories() {
        // given
        let testBundle = Bundle(for: type(of: self))
        let path = testBundle.path(forResource: "testDataFull", ofType: "json")
        let data = try? Data(contentsOf: URL(fileURLWithPath: path!), options: .alwaysMapped)
        
        URLProtocolMock.data = data
        
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolMock.self]

        let session = URLSession(configuration: config)
        poqRepository.apiRequest = ApiRequest(session: session)
        
        // when
        poqRepository.getRepositories()
        
        // then
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            XCTAssertNotNil(self.poqRepository.repositories, "List of repositories must not be nil")
            XCTAssert(self.poqRepository.repositories.count > 0, "List of repositories must not be empty")
        }
    }
    
    func testGetRepositoriesFail() {
        // given
        URLProtocolMock.data = "[some garbage data]".data(using: .utf8)
        
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolMock.self]

        let session = URLSession(configuration: config)
        poqRepository.apiRequest = ApiRequest(session: session)
        
        // when
        poqRepository.getRepositories()
        
        // then
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            XCTAssertNotNil(self.poqRepository.repositories, "List of repositories must not be nil")
            XCTAssert(self.poqRepository.repositories.count == 0, "List of repositories must be empty")
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
