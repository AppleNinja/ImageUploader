//
//  BaseRowModel.swift
//  ImageUploader
//
//  Created by Sreekumar K on 03/04/2020.
//  Copyright © 2020 Sreekumar K. All rights reserved.
//

import UIKit

class BaseRowModel: NSObject {
    var tag: Int = 0
    var rowId: Int = 0
    var rowTitle: String = ""
    var rowCellIdentifier = ""
    var rowValue: Any?
    var rowHeight: CGFloat = 0.0
    var rowWidth: CGFloat = 0.0
    var delegate: Any?
}
