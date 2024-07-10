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
    func redirectToOTP(phoneNumber: String, coutryPhoneCode: String)
    func redirectToHome()
    func redirectToChat(receiverData: UserModel)
    func redirectToContact()
    func redirectoWelcome()
}


class Router: RouterProtocol {
    func goBack() {
        SceneDelegate().sceneDelegate?.mainNav?.popViewController(animated: true)
    }
    
    func redirectToLogin() {
        let vc = LoginVC(loginViewModel: LoginViewModel(router: Router()))
        SceneDelegate().sceneDelegate?.mainNav?.pushViewController(vc, animated: true)
    }
    
    func redirectToOTP(phoneNumber: String, coutryPhoneCode: String) {
        let vc = OTPViewController(viewModel: OTPViewModel(router: Router(), phoneNumber: phoneNumber, coutryPhoneCode: coutryPhoneCode))
        SceneDelegate().sceneDelegate?.mainNav?.pushViewController(vc, animated: true)
    }
    
    func redirectToHome() {
        let vc = HomeViewController(viewModel: HomeViewModel(router: Router()))
        SceneDelegate().sceneDelegate?.mainNav?.pushViewController(vc, animated: true)
    }
    
    func redirectToContact() {
        let vc = ContactsViewController(viewModel: ContactsViewModel(router: Router()))
        SceneDelegate().sceneDelegate?.mainNav?.present(vc, animated: true)
    }

    
    func redirectToChat(receiverData: UserModel) {
        let vc = ChatViewController(viewModel: ChatViewModel(router: Router(), receiverData: receiverData))
        SceneDelegate().sceneDelegate?.mainNav?.pushViewController(vc, animated: true)
    }
    
    func redirectoWelcome() {
        let vc = WelcomeVC(welcomeViewModel: WelcomeViewModel(router: Router()))
        SceneDelegate().sceneDelegate?.mainNav = UINavigationController(rootViewController: vc)
        SceneDelegate().sceneDelegate?.mainNav?.navigationBar.isHidden = true
        SceneDelegate().sceneDelegate?.window?.rootViewController = SceneDelegate().sceneDelegate?.mainNav
        SceneDelegate().sceneDelegate?.window?.makeKeyAndVisible()
    }

}





