//
//  GalleryInteractor.swift
//  ImageUploader
//
//  Created by Sreekumar K on 03/04/2020.
//  Copyright © 2020 Sreekumar K. All rights reserved.
//

import Firebase
import Foundation
import ObjectMapper

class GalleryInteractor {
    // MARK: Properties

    weak var output: GalleryUseCaseOutput?
    let service = GalleryService()
}

extension GalleryInteractor: GalleryUseCase {
    func uploadImages(imageDataArray: [Data]) {
        service.uploadImagesToFirebase(imageDataArray: imageDataArray, successHandler: { (urls) in
            if let urlArray = urls {
                self.service.uploadImagesURLToDatabase(imgUrlArray: urlArray, successHandler: {
                    self.output?.imagesUploaded()
                }, errorHandler: { (error) in
                    self.output?.errorReceived(error: error! as NSError)
                })
            }
        }) { (error) in
            self.output?.errorReceived(error: error as NSError? ?? NSError(domain: Constants.Error.networkErrorDomain, code: Constants.Error.genericErrorCode, userInfo: nil))
        }
    }

    func fireBaseAnonymouslyLogin() {
        Auth.auth().signInAnonymously { _, error in
            if error != nil {
                self.output?.errorReceived(error: error as NSError? ?? NSError(domain: Constants.Error.networkErrorDomain, code: Constants.Error.genericErrorCode, userInfo: nil))
            } else {
                self.output?.firebaseUserLoggedIn()
            }
        }
    }

    func downloadImagesFromFirebase() {
        service.downloadImagesFromFirebase { resultModel in
            if let imagesArray = resultModel?.imagesArray {
                self.output?.imagesReceivedFromServer(images: imagesArray)
            } else {
                self.output?.errorReceived(error: NSError(domain: Constants.Error.genericErrorDomain, code: Constants.Error.genericErrorCode, userInfo: nil))
            }
        }
    }
}
