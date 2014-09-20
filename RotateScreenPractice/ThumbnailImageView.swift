//
//  ThumbnailImage.swift
//  RotateScreenPractice
//
//  Created by Daiwei on 9/16/14.
//  Copyright (c) 2014 Daiwei Lu. All rights reserved.
//

import UIKit

class ThumbnailImageView: UIImageView {

    init(image: UIImage!, frame: CGRect, roundingCorners: UIRectCorner) {
        super.init(image: image)
        self.contentMode = UIViewContentMode.ScaleAspectFill
        self.userInteractionEnabled = true
        self.clipsToBounds = true
        self.frame = frame
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
