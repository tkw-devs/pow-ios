//
//  Constants.swift
//  Poq
//
//  Created by Mihai Ionescu on 17/02/2020.
//  Copyright © 2020 Tecknoworks srl. All rights reserved.
//

import Foundation

struct APPURL {
    private static let BaseURL = "https://api.github.com/"
    
    static var GetRepositoriesURL: String {
        return BaseURL + "orgs/square/repos"
    }
}
