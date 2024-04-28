//
//  SettingController.swift
//  X
//
//  Created by Kevin Hsiao on 2024/4/28.
//  Copyright © 2024 Thino Inc. All rights reserved.
//

import UIKit
import ProgressHUD

class SettingController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }

    func setupViews() {
        self.title = "Setting"
        self.view.addSubview(self.configBtn)
        self.configBtn.snp.remakeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(44)
            make.centerY.equalToSuperview()
        }
    }

    func getRequestAction() {
        ProgressHUD.animate("loading")
        let url = URL(string: "https://httpbin.org/get?app_version=1.0&system_version=13.1")
        let task = URLSession.shared.dataTask(with: url!) {  [weak self] (data, response, error) in
            guard let `self` = self else { return }
            DispatchQueue.main.async {
                if let error = error {
                    print("Error: \(error)")
                    ProgressHUD.error("\(error)")
                } else if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        print("Response: \(json)")
                        self.view.makeToast("\(json)")
                    } catch {
                        print("Error parsing JSON: \(error)")
                        ProgressHUD.error("\(error)")
                    }
                }
            }
        }
        task.resume()
    }

    private lazy var configBtn: BaseButton = {
        let btn = BaseButton()
        btn.normalTitle = "Get config info"
        btn.setBorder(radius: 4)
        btn.backgroundColor = .orange
        btn.titleFont = .systemFont(ofSize: 16, weight: .bold)
        btn.touchUpInsideCallback = { [weak self] in
            guard let `self` = self else { return }
            self.getRequestAction()
        }
        return btn
    }()

}
