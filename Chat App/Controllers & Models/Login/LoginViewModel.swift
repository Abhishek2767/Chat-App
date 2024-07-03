//
//  LoginViewModel.swift
//  Chat App
//
//  Created by SST PC on 03/07/24.
//

import Foundation

protocol LoginProtocol {
    var router: RouterProtocol { get }
}

class LoginViewModel: LoginProtocol {
    
    var router: RouterProtocol
    
    init(router: RouterProtocol) {
        self.router = router
    }
}
