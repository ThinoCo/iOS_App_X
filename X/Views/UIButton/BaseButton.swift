//
//  BaseButton.swift
//  X
//
//  Created by Kevin Hsiao on 2024/4/26.
//  Copyright © 2024 Thino Inc. All rights reserved.
//

import UIKit

class BaseButton: UIButton {

    var touchUpInsideCallback: VoidCallback?

    var titleFont: UIFont? {
        didSet {
            titleLabel?.font = titleFont
        }
    }

    var normalTitle: String? {
        get {
            return self.title(for: .normal)
        }
        set {
            setTitle(newValue, for: .normal)
        }
    }

    var contentMargin: UIEdgeInsets? {
        didSet {
            /*
             TODO:
             1:只有标题
             2:只有图片
             3:有标题和图片
                3.1: 文左图右
                3.2: 文右图左
                3.3: 文上图下
                3.4: 文下图上
             */
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addTarget(self, action: #selector(touchUpInsideAction), for: .touchUpInside)
    }

    @objc func touchUpInsideAction() {
        self.touchUpInsideCallback?()
    }

}
