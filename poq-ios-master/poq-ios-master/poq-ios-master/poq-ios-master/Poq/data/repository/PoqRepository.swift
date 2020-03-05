//
//  PoqRepository.swift
//  Poq
//
//  Created by Mihai Ionescu on 18/02/2020.
//  Copyright © 2020 Tecknoworks srl. All rights reserved.
//

import SwiftUI
import Combine

class PoqRepository : ObservableObject {
    
    @Published public var repositories: [PoqRepositoryModel] = []
    
    @Published public var loading = false
    @Published public var hasError = false
    
    var apiRequest: ApiRequest = ApiRequest()
    
    func getRepositories() {
        loading = true
        hasError = false
        
        _ = apiRequest.getRepositories()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished: break
                case .failure(let error):
                    PoqLog.log(error.localizedDescription)
                    self.hasError = true
                }
                self.loading = false
            }, receiveValue: { repositories in
                self.repositories = repositories
            })
    }
    
    static func testData() -> PoqRepository {
        let poqRepository = PoqRepository()
        poqRepository.repositories = [PoqRepositoryModel("test name", "test description")]
        return poqRepository
    }
    
}
