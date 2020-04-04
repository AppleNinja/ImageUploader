//
//  AppSetup.swift
//  ImageUploader
//
//  Created by Sreekumar K on 03/04/2020.
//  Copyright © 2020 Sreekumar K. All rights reserved.
//

import Foundation
import UIKit

extension AppDelegate {
    internal func setupApp(window: UIWindow) {
        boot(window: window)
    }
    
    internal func boot(window: UIWindow) {
        RootRouter().presentRootScreen(in: window)
    }
    
}
