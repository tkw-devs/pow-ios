//
//  NetworkManager.swift
//  Poq
//
//  Created by Mihai Ionescu on 17/02/2020.
//  Copyright © 2020 Tecknoworks srl. All rights reserved.
//

import Foundation
import Combine

class ApiRequest {
    
    private let session: URLSession
        
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func getRepositories() -> AnyPublisher<[PoqRepositoryModel], Error> {
        let url = URL(string: APPURL.GetRepositoriesURL)!
        return session.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: Repositories.self, decoder: JSONDecoder())
            .map { RepositoryMapper.toPoqRepositoryModelList($0) }
            .eraseToAnyPublisher()
    }
    
}
