//
//  ImageUploaderTests.swift
//  ImageUploaderTests
//
//  Created by Sreekumar K on 03/04/2020.
//  Copyright © 2020 Sreekumar K. All rights reserved.
//

import XCTest
@testable import ImageUploader

class GalleryInteractorTests: XCTestCase {

    var mockOutput: MockImageListIntrectorOutput?
    var interactor: GalleryInteractor?
    var mockInput: MockImageListIntrectorInput?
    let testMockImage = UIImage(named: "mock-image")

    override func setUp() {
        mockInput = MockImageListIntrectorInput()
        mockOutput = MockImageListIntrectorOutput()
        interactor = GalleryInteractor()
        interactor?.output = mockOutput
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testMockImageSuccess() {
        XCTAssert(testMockImage != nil)
    }

    func testDownloadImages() {
        let excption = expectation(description: "fetching data")
        interactor?.service.downloadImagesFromFirebase(completionHandler: { (result) in
            self.interactor?.output?.imagesReceivedFromServer(images: [])
            excption.fulfill()
        })
        wait(for: [excption], timeout: 30)
        
        XCTAssert(mockOutput?.onRequestSuccess == 1,
                  "Expect download images called once")
        XCTAssert(mockOutput?.imagesData != nil, "Expect image list to be present")
    }
    
    func testDownloadImagesFailed() {
        let excption = expectation(description: "fetching data")
        interactor?.service.downloadImagesFromFirebase(completionHandler: { (result) in
            if let _ = result?.imagesArray {
                
            } else {
                self.interactor?.output?.errorReceived(error: NSError(domain: Constants.Error.genericErrorDomain, code: Constants.Error.genericErrorCode, userInfo: nil))
                
            }
            excption.fulfill()
        })
        wait(for: [excption], timeout: 30)
        
        XCTAssert(mockOutput?.onRequestSuccess == 0,
                  "Expect download images should Failed")
        XCTAssert(mockOutput?.imagesData == nil, "Expect image list to be present")
    }
    
    func testUploadImagesFirebaseStorage() {
        self.testMockImageSuccess()
        let excption = expectation(description: "fetching data")
        guard let imageData = testMockImage?.pngData() else {
            XCTFail()
            return
        }
        interactor?.service.uploadImagesToFirebase(imageDataArray: [imageData], successHandler: { (imagesUrl) in
            self.interactor?.output?.imagesUploaded()
            excption.fulfill()
        }, errorHandler: { (error) in
            XCTFail()
        })
        wait(for: [excption], timeout: 30)
        
        XCTAssert(mockOutput?.onRequestSuccess == 1,
                  "Expect upload images called once")
    }
    
    func testInputUploadImagesFirebaseStorage() {
        self.testMockImageSuccess()
        guard let imageData = testMockImage?.pngData() else {
            XCTFail()
            return
        }
        mockInput?.uploadImages(imageDataArray: [imageData])
        XCTAssert(mockInput?.inputMethodCalled == 1,
                  "Expect upload images called once")
    }
    
    func testUploadImagesFirebaseStorageFailed() {
        self.testMockImageSuccess()
        let excption = expectation(description: "fetching data")
        interactor?.service.uploadImagesToFirebase(imageDataArray: [], successHandler: { (imagesUrl) in
        }, errorHandler: { (error) in
            self.interactor?.output?.errorReceived(error: error! as NSError)
            excption.fulfill()
        })
        wait(for: [excption], timeout: 30)
        
        XCTAssert(mockOutput?.onRequestSuccess == 0,
                  "Expect upload images failed")
    }
    
    func testUploadImagesUrlFirebaseDatabase() {
        let excption = expectation(description: "fetching data")
        let imageUrl = "https://images8.alphacoders.com/101/1013802.jpg"
        interactor?.service.uploadImagesURLToDatabase(imgUrlArray: [imageUrl], successHandler: {
            self.interactor?.output?.imagesUploaded()
            excption.fulfill()
        }, errorHandler: { (error) in

        })
        wait(for: [excption], timeout: 30)
        
        XCTAssert(mockOutput?.onRequestSuccess == 1,
                  "Expect upload images called once")
    }
    
    func testUploadImagesUrlFirebaseDatabaseFailed() {
        let excption = expectation(description: "fetching data")
        interactor?.service.uploadImagesURLToDatabase(imgUrlArray: [], successHandler: {
        }, errorHandler: { (error) in
            self.interactor?.output?.errorReceived(error: error! as NSError)
            excption.fulfill()
        })
        wait(for: [excption], timeout: 30)
        
        XCTAssert(mockOutput?.onRequestSuccess == 0,
                  "Expect upload images failed")
    }


}
