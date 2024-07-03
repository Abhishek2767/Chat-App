//
//  Extensions.swift
//  Chat App
//
//  Created by SST PC on 03/07/24.
//

import Foundation

extension NSObject {
    var className: String {
        String(describing: type(of: self))
    }
    
    class var className: String {
        String(describing: self)
    }
}
