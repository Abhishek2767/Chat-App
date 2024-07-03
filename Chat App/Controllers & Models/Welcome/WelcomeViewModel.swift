//
//  WelcomeVIewModel.swift
//  Chat App
//
//  Created by SST PC on 03/07/24.
//

import Foundation
protocol WelcomeProtocol {
    var router: RouterProtocol { get }
}

class WelcomeViewModel: WelcomeProtocol {
    
    var router: RouterProtocol
    
    init(router: RouterProtocol) {
        self.router = router
    }
}
