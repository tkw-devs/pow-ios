//
//  PoqRepository.swift
//  Poq
//
//  Created by Mihai Ionescu on 18/02/2020.
//  Copyright © 2020 Tecknoworks srl. All rights reserved.
//

import Foundation
import Combine

class PoqRepositoryModel: Identifiable, ObservableObject {
    
    var id = UUID()
    
    @Published var name: String?
    @Published var description: String?
    
    init(_ name:String?, _ description:String?) {
        self.name = name
        self.description = description
    }
    
}

