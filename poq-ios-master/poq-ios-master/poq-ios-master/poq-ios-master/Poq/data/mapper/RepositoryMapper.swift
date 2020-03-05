//
//  RepositoryMapper.swift
//  Poq
//
//  Created by Mihai Ionescu on 18/02/2020.
//  Copyright © 2020 Tecknoworks srl. All rights reserved.
//

import Foundation

class RepositoryMapper {
    
    static func toPoqRepositoryModel(_ repository: RepositoryDTO) -> PoqRepositoryModel {
        return PoqRepositoryModel(repository.name, repository.description)
    }
    
    static func toPoqRepositoryModelList(_ repositories: Repositories) -> [PoqRepositoryModel] {
        var modelList = [PoqRepositoryModel]()
        for repositoryDTO in repositories {
            modelList.append(toPoqRepositoryModel(repositoryDTO))
        }
        return modelList
    }
    
}
