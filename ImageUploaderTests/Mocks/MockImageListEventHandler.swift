//
//  MockImageListEventHandler.swift
//  ImageUploaderTests
//
//  Created by Sreekumar K on 03/04/2020.
//  Copyright © 2020 Sreekumar K. All rights reserved.
//

@testable import ImageUploader
import XCTest

class MockImageListEventHandler: GalleryPresentation {
    private(set) var onRequestImageListCalled = 0
    
    func fireBaseAnonymouslyLogin() {
        onRequestImageListCalled += 1
    }
    
    func downloadImagesFromFirebase() {
        onRequestImageListCalled += 1
    }

    func uploadImages(imageDataArray: [Data]) {
        onRequestImageListCalled += 1
    }
}
