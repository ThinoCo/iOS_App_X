//
//  BaseNavigationController.swift
//  X
//
//  Created by Kevin Hsiao on 2024/4/25.
//  Copyright © 2024 Thino Inc. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }

    func setupViews() {
        self.view.backgroundColor = .yellow
    }

}
