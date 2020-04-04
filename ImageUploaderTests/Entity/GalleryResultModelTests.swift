//
//  ImageUploaderTests.swift
//  ImageUploaderTests
//
//  Created by Sreekumar K on 03/04/2020.
//  Copyright © 2020 Sreekumar K. All rights reserved.
//

import XCTest
@testable import ImageUploader

class GalleryResultModelTests: XCTestCase {

    var jsonString: String!
    override func setUp() {
        jsonString = "{\"AocaNKb0ipOXr3OVA0IG76xe7dA3\" : \"https://firebasestorage.googleapis.com/v0/b/imageuploader-b3d9f.appspot.com/o/AocaNKb0ipOXr3OVA0IG76xe7dA3%2F607694857235.jpg%2FCFC2709E-C873-470B-8464-1297E39C9D20.png?alt=media&token=974cb988-18e4-40ae-b118-acf49532e395\"}"
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testJsonParsedSuccess() {
        let images = GalleryResultModel(JSONString: jsonString)
        XCTAssert(images != nil, "Expect image to parsed")
    }
    
    func testJsonParsedFailer() {
        let images = GalleryResultModel(JSONString: "jsonStringfailed")
        XCTAssertNil(images, "Expect image to parsing failed")
    }
    
    func testDataAuthenticity() {
        guard let images = GalleryResultModel(JSONString: jsonString) else {
            XCTFail()
            return
        }
        
        XCTAssert(images.imagesArray.count > 0, "Expect Atleast one image")
    }
}
