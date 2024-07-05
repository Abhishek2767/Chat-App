//
//  OTPViewModel.swift
//  Chat App
//
//  Created by SST PC on 04/07/24.
//

import Foundation
import FirebaseAuth

protocol OTPProtocol {
    var router: RouterProtocol { get }
    
    func signIn(otp: String, completion: @escaping (Result<String, Error>) -> Void)
}

class OTPViewModel: OTPProtocol {
    
    var router: RouterProtocol
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    
    func signIn(otp: String, completion: @escaping (Result<String, Error>) -> Void) {
        guard let verificationID = Utility.valueFor(forKey: PreferenceKeys.verificationID.rawValue) as? String else {
            return
        }
        
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: otp)
        
        Auth.auth().signIn(with: credential) { authData, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            completion(.success("Login Successfull!"))
        }
    }
}
