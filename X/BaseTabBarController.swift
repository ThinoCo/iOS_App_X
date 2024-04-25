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

        let userCenterVC = UserCenterController()
        userCenterVC.tabBarItem = UITabBarItem(title: "UserCenter", image: nil, selectedImage: nil)
        let userCenterNav = BaseNavigationController(rootViewController: userCenterVC)

        self.viewControllers = [loginNav]
    }

}
