//
//  MockImageListIntrectorOutput.swift
//  ImageUploaderTests
//
//  Created by Sreekumar K on 03/04/2020.
//  Copyright © 2020 Sreekumar K. All rights reserved.
//

import UIKit
@testable import ImageUploader

class MockImageListIntrectorOutput: GalleryUseCaseOutput {
    private(set) var onRequestSuccess         = 0
    private(set) var imagesData: [GalleryResultModel.Images]?
    private(set) var error: Error?

    func imagesReceivedFromServer(images: [GalleryResultModel.Images]) {
        self.imagesData = images
        onRequestSuccess += 1
    }
    
    func imagesUploaded() {
        onRequestSuccess += 1
    }
    
    func errorReceived(error: NSError) {
        self.error = error
        onRequestSuccess = 0
    }
    
    func firebaseUserLoggedIn() {
        onRequestSuccess += 1
    }
}

class MockImageListIntrectorInput: GalleryUseCase {
    private(set) var inputMethodCalled = 0
    
    func downloadImagesFromFirebase() {
        self.inputMethodCalled += 1
    }
    
    func fireBaseAnonymouslyLogin() {
        self.inputMethodCalled += 1
    }
    
    func uploadImages(imageDataArray: [Data]) {
        self.inputMethodCalled += 1
    }
}
