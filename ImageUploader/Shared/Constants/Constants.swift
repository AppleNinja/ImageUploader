//
//  Constants.swift
//  ImageUploader
//
//  Created by Sreekumar K on 03/04/2020.
//  Copyright © 2020 Sreekumar K. All rights reserved.
//

import UIKit

class Constants: NSObject {
    struct Error {
        static let genericErrorDomain = ""
        static let genericErrorCode = 111
        static let genericErrorMessage = "Something went wrong"
        
        static let networkErrorDomain = ""
        static let networkErrorCode = 222
        static let networkErrorMessage = "Networking is not working. Please try again."
        static let networkErrorTitle = "Network not found"
        static let networkErrorSubTitle = "Please try again"
    }
    
    struct EndPoints {
        static let firebaseStorageBucket = "gs://imageuploader-b3d9f.appspot.com"
        static let image = "images"
    }
    
    struct FirebaseDatabase {
        static let name = "result"
    }
    
    struct ProgressIndicator {
        static let radius: CGFloat = 18
        static let strokeWidth: CGFloat = 3
    }
}
