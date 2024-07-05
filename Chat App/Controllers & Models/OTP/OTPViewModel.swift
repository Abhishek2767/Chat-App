//
//  OTPViewModel.swift
//  Chat App
//
//  Created by SST PC on 04/07/24.
//

import Foundation
protocol OTPProtocol {
    var router: RouterProtocol { get }
}

class OTPViewModel: OTPProtocol {
    
    var router: RouterProtocol
    
    init(router: RouterProtocol) {
        self.router = router
    }
}
