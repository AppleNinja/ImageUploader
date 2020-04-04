//
//  BaseViewController.swift
//  ImageUploader
//
//  Created by Sreekumar K on 03/04/2020.
//  Copyright © 2020 Sreekumar K. All rights reserved.
//

import UIKit
import SVProgressHUD

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
    }

    func setupAppearance() {}
}

// MARK: - Loadable

extension BaseViewController: Loadable {
    @objc func showLoading() {
        DispatchQueue.main.async {
            SVProgressHUD.show()
        }
    }

    @objc func hideLoading() {
        SVProgressHUD.dismiss()
    }
}
