//
//  AppSetup.swift
//  ImageUploader
//
//  Created by Sreekumar K on 03/04/2020.
//  Copyright © 2020 Sreekumar K. All rights reserved.
//

import UIKit

class RootRouter: RootWireframe {
    func presentRootScreen(in window: UIWindow) {
        window.makeKeyAndVisible()
        let vc = GalleryRouter.setupModule()
        window.rootViewController = UINavigationController(rootViewController: vc)
    }
}
