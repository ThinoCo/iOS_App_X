//
//  UIView+.swift
//  X
//
//  Created by Kevin Hsiao on 2024/4/26.
//  Copyright © 2024 Thino Inc. All rights reserved.
//

import UIKit

extension UIView {
    func setBorder(radius: CGFloat, width: CGFloat = 0, color: UIColor? = nil) {
        self.layer.cornerRadius = radius
        if width >= 0 {
            self.layer.borderWidth = width
        }
        if let cgColor = color?.cgColor {
            self.layer.borderColor = cgColor
        }
    }
}
