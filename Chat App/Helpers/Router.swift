//
//  Router.swift
//  Smart AI Chat
//
//  Created by Abhishek Kurmi on 05/09/23.
//

import Foundation
import UIKit

protocol RouterProtocol {
    func goBack()
    func redirectToLogin()
}


class Router: RouterProtocol {
    func goBack() {
        SceneDelegate().sceneDelegate?.mainNav?.popViewController(animated: true)
    }
    
    func redirectToLogin() {
        let vc = LoginVC(loginViewModel: LoginViewModel(router: Router()))
        SceneDelegate().sceneDelegate?.mainNav?.pushViewController(vc, animated: true)
    }
}





