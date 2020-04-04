//
//  GalleryContract.swift
//  ImageUploader
//
//  Created by Sreekumar K on 03/04/2020.
//  Copyright © 2020 Sreekumar K. All rights reserved.
//

import Foundation

protocol GalleryView: Loadable {
    // TODO: Declare view methods
    func imagesReceived(images: [GalleryResultModel.Images])
    func firebaseUserLoggedIn()
    func imageUploaded()
    func showError(error: NSError)
}

protocol GalleryPresentation: class {
    // TODO: Declare presentation methods
    func downloadImagesFromFirebase()
    func fireBaseAnonymouslyLogin()
    func uploadImages(imageDataArray: [Data])
}

protocol GalleryUseCase: class {
    // TODO: Declare use case methods
    func downloadImagesFromFirebase()
    func fireBaseAnonymouslyLogin()
    func uploadImages(imageDataArray: [Data])
}

protocol GalleryUseCaseOutput: class {
    // TODO: Declare interactor output methods
    func imagesReceivedFromServer(images: [GalleryResultModel.Images])
    func firebaseUserLoggedIn()
    func imagesUploaded()
    func errorReceived(error: NSError)
}

protocol GalleryWireframe: class {
    // TODO: Declare wireframe methods
}
