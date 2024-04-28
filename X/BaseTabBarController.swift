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
        let loginNav = BaseNavigationController(rootViewController: loginVC)

        let profileVC = ProfileController()
        let profileNav = BaseNavigationController(rootViewController: profileVC)

        let settingVC = SettingController()
        let settingNav = BaseNavigationController(rootViewController: settingVC)
        
        self.viewControllers = [loginNav, settingNav, profileNav]
    }

}
