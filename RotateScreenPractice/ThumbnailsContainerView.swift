//
//  ThumbnailsContainerView.swift
//  RotateScreenPractice
//
//  Created by Daiwei on 9/16/14.
//  Copyright (c) 2014 Daiwei Lu. All rights reserved.
//

import UIKit

class ThumbnailsContainerView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    func addSubviews(subviews: [UIView]!) {
        for view in subviews {
            self.addSubview(view)
        }
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
