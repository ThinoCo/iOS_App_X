//
//  LoginController.swift
//  X
//
//  Created by Kevin Hsiao on 2024/4/25.
//  Copyright © 2024 Thino Inc. All rights reserved.
//

import UIKit
import SnapKit
import Toast_Swift

class LoginController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }

    func setupViews() {
        self.title = "Connect"
        self.view.backgroundColor = .orange

        self.view.addSubview(self.hostTF)
        self.view.addSubview(self.userNameTF)
        self.view.addSubview(self.passwordTF)
        self.view.addSubview(self.loginBtn)

        self.hostTF.snp.remakeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(44)
            make.top.equalToSuperview().offset(100)
        }

        self.userNameTF.snp.remakeConstraints { make in
            make.leading.trailing.height.equalTo(self.hostTF)
            make.top.equalTo(self.hostTF.snp.bottom).offset(20)
        }

        self.passwordTF.snp.remakeConstraints { make in
            make.leading.trailing.height.equalTo(self.hostTF)
            make.top.equalTo(self.userNameTF.snp.bottom).offset(20)
        }

        self.loginBtn.snp.remakeConstraints { make in
            make.leading.trailing.height.equalTo(self.hostTF)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordTF.snp.bottom).offset(40)
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    private lazy var loginBtn: BaseButton = {
        let btn = BaseButton()
        btn.touchUpInsideCallback = { [weak self] in
            guard let `self` = self else { return }
            self.view.endEditing(true)
            if let host = self.hostTF.text, let userName = self.userNameTF.text, let password = self.passwordTF.text {
                self.view.makeToast("Connecting: \(host) \(userName) \(password)", duration: 3, position: .center)
            }
        }
        btn.titleFont = .systemFont(ofSize: 16, weight: .bold)
        btn.normalTitle = "Connect"
        btn.setBorder(radius: 8)
        btn.backgroundColor = .lightGray
        return btn
    }()

    private lazy var hostTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "host"
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.textColor = .orange
        return tf
    }()

    private lazy var userNameTF: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .white
        tf.placeholder = "user name"
        tf.borderStyle = .roundedRect
        tf.textColor = .orange
        return tf
    }()

    private lazy var passwordTF: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .white
        tf.placeholder = "password"
        tf.borderStyle = .roundedRect
        tf.textColor = .orange
        return tf
    }()

}
