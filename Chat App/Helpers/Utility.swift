//
//  Utility.swift
//  Chat App
//
//  Created by SST PC on 05/07/24.
//

import Foundation
import UIKit
import KRProgressHUD

class Utility: NSObject {
    
    // MARK: Loading View
    class func showLoadingView() {
        KRProgressHUD
            .set(activityIndicatorViewColors: [.primaryButton])
            .show()
    }
    
    class func showLoadingView(withTitle title: String) {
        KRProgressHUD
            .set(activityIndicatorViewColors: [.primaryButton])
            .show(withMessage: title)
    }
    
    class func hideLoadingView() {
        KRProgressHUD.dismiss()
    }
    

    class func currentDate(_ format: String = "yyyy-MM-dd-HH-mm-ss") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: Date())
    }
    
    class func setValuefor(_ value: Any, forKey key: String) {
        UserDefaults.standard.setValue(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    class func valueFor(forKey key: String) -> Any {
        return UserDefaults.standard.value(forKey: key) as Any
    }
    
    class func removeValueFor(forKey key: String) {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: key)
        defaults.synchronize()
    }
    
    
    class func getPrivateChannelId(otherUserId : String,loginUserId : String) -> String {
        var idArray : [String] = []
        idArray = [otherUserId,loginUserId]
        idArray.sort(){$0 < $1}
        return "\(idArray.first!)_\(idArray.last!)"
    }

    class func getCurrentTime() -> Int64 {
        let date = Date().timeIntervalSince1970 * 1000
        return Int64(date)
    }

}
