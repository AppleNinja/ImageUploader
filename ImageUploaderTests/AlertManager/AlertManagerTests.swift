//
//  AlertManagerTests.swift
//  ImageUploaderTests
//
//  Created by Sreekumar K on 03/04/2020.
//  Copyright © 2020 Sreekumar K. All rights reserved.
//

import XCTest
@testable import ImageUploader

class AlertManagerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAlertManagerShowed() {
        AlertManager.showAlert()
        
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            XCTAssert(topController.isKind(of: UIAlertController.self))
        }
    }

}
