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
    func redirectToOTP()
    func redirectToHome()
    func redirectToChat()
}


class Router: RouterProtocol {
    func goBack() {
        SceneDelegate().sceneDelegate?.mainNav?.popViewController(animated: true)
    }
    
    func redirectToLogin() {
        let vc = LoginVC(loginViewModel: LoginViewModel(router: Router()))
        SceneDelegate().sceneDelegate?.mainNav?.pushViewController(vc, animated: true)
    }
    
    func redirectToOTP() {
        let vc = OTPViewController(viewModel: OTPViewModel(router: Router()))
        SceneDelegate().sceneDelegate?.mainNav?.pushViewController(vc, animated: true)
    }
    
    func redirectToHome() {
        let vc = HomeViewController(viewModel: HomeViewModel(router: Router()))
        SceneDelegate().sceneDelegate?.mainNav?.pushViewController(vc, animated: true)
    }
    
    func redirectToChat() {
        let vc = ChatViewController(viewModel: ChatViewModel(router: Router()))
        SceneDelegate().sceneDelegate?.mainNav?.pushViewController(vc, animated: true)
    }
}





