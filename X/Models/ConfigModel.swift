//
//  ConfigModel.swift
//  X
//
//  Created by Kevin Hsiao on 2024/4/28.
//  Copyright © 2024 Thino Inc. All rights reserved.
//

import UIKit
import HandyJSON

class ConfigModel: NSObject, HandyJSON {
    var latestAppVersion: Double = 0
    required override init() {}
}
