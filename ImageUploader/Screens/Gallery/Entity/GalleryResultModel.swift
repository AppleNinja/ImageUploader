//
//  GalleryResponseModel.swift
//  ImageUploader
//
//  Created by Sreekumar K on 03/04/2020.
//  Copyright © 2020 Sreekumar K. All rights reserved.
//

import Foundation
import ObjectMapper

class GalleryResultModel: Mappable {
    
    // MARK: - Model Variables
    typealias Images = (id: String, url: String)
    var imagesArray: [Images] = []
    
    public required init?(map: Map) {
        mapping(map: map)
    }
    
    // MARK: - Model mapping
    
    public func mapping(map: Map) {
        let rawDictionary = map.JSON
        let items = rawDictionary.compactMap { (key, value) -> Images? in
            guard let url = value as? String else { return nil }
            return (key, url)
        }
        imagesArray = items
    }
}
