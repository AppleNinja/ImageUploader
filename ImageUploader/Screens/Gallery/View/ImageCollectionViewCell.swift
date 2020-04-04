//
//  ImageCollectionViewCell.swift
//  ImageUploader
//
//  Created by Sreekumar K on 03/04/2020.
//  Copyright © 2020 Sreekumar K. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    // MARK: - IBOutlets
    
    @IBOutlet var imageView: UIImageView!
    
    // MARK: - Methods
    
    func updateCell(model: GalleryResultModel.Images) {
        imageView.kf.setImage(with: URL(string: model.url))
    }
}
