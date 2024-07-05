//
//  HomeViewModel.swift
//  Chat App
//
//  Created by SST PC on 04/07/24.
//

import Foundation
protocol HomeProtocol {
    var router: RouterProtocol { get }
}

class HomeViewModel: HomeProtocol {
    
    var router: RouterProtocol
    
    init(router: RouterProtocol) {
        self.router = router
    }
}
