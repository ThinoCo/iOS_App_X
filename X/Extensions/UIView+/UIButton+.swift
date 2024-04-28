//
//  UIButton+.swift
//  X
//
//  Created by Kevin Hsiao on 2024/4/26.
//  Copyright © 2024 Thino Inc. All rights reserved.
//

import UIKit

extension UIButton {
    /*

    private static var observationContext = 0
    private struct AssociatedKeys {
        static var monitoredTextFields: UInt8 = 0
    }

    // 一个计算属性，用来获取和设置被观察的 UITextField 数组
    private var monitoredTextFields: [UITextField] {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.monitoredTextFields) as? [UITextField] ?? []
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.monitoredTextFields, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    func enableWhenTextFieldsFilled(_ textFields: [UITextField]) {
        // 保存传递过来的 UITextField 数组
        monitoredTextFields = textFields

        // 将按钮设为无效状态
        isEnabled = !textFields.contains { $0.text?.isEmpty ?? true }

        // Traverse the textFields array and use KVO to add observation for each textField
        for textField in textFields {
            textField.addObserver(self, forKeyPath: #keyPath(UITextField.text), options: .new, context: &UIButton.observationContext)
        }

        // When the controller is destroyed, remove the observer
        NotificationCenter.default.addObserver(forName: UIViewController.viewDidDisappearNotification, object: nil, queue: .main) { [weak self] _ in
            guard let self = self else { return }
            self.stopMonitoringTextFields()
        }
    }

    private func stopMonitoringTextFields() {
        for textField in monitoredTextFields {
            textField.removeObserver(self, forKeyPath: #keyPath(UITextField.text), context: &UIButton.observationContext)
        }
        monitoredTextFields = []
    }

    // 重写观察器方法，当输入框文本改变时 enable 按钮
    override open func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard context == &UIButton.observationContext else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
            return
        }

        // 确认所有的UITextField都有输入
        isEnabled = !monitoredTextFields.contains { $0.text?.isEmpty ?? true }
    }

    open override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let textField = object as? UITextField {
            self.isEnabled = textField.text?.isEmpty == false
        } else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
            return
        }
    }
     */
}
