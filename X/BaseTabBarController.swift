//
//  BaseTabBarController.swift
//  X
//
//  Created by Kevin Hsiao on 2024/4/25.
//  Copyright © 2024 Thino Inc. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
        self.setupControllers()
    }
    

    func setupViews() {
        self.view.backgroundColor = .white
        self.tabBar.barTintColor = .white
        self.tabBar.tintColor = .black
    }

    func setupControllers() {
        let loginVC = LoginController()
        loginVC.tabBarItem = UITabBarItem(title: "Login", image: nil, selectedImage: nil)
        let loginNav = BaseNavigationController(rootViewController: loginVC)

        let profileVC = ProfileController()
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: nil, selectedImage: nil)
        let userCenterNav = BaseNavigationController(rootViewController: profileVC)

        self.viewControllers = [loginNav]
    }

}
