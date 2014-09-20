//
//  ImageZoomView.swift
//  RotateScreenPractice
//
//  Created by Daiwei on 9/18/14.
//  Copyright (c) 2014 Daiwei Lu. All rights reserved.
//

import UIKit

class ImageZoomView: UIScrollView, UIScrollViewDelegate {

    var image: UIImage
    var imageView: UIImageView

    init(image: UIImage, frame: CGRect) {
        self.image = image
        self.imageView = UIImageView(image: image)

        super.init(frame: frame)

        self.delegate = self
        self.maximumZoomScale = 5
        self.addSubview(self.imageView)

        var aspectRatio = image.size.width / image.size.height
        var height: CGFloat
        var width: CGFloat

        if bounds.width / bounds.height > aspectRatio {
            height = bounds.height
            width = height * aspectRatio
        } else {
            width = bounds.width
            height = width / aspectRatio
        }

        imageView.bounds = CGRect(x: 0, y: 0, width: width, height: height)
        imageView.center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)

        println("ImageZoomView.frame = \(frame)")
        println("ImageZoomView.imageView.frame = \(imageView.frame)")

        contentSize = imageView.frame.size

        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: "orientationChanged:",
            name: UIDeviceOrientationDidChangeNotification,
            object: nil)
    }

    override func layoutSubviews() {

    }

    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }

    func orientationChanged(note: NSNotification) {

    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
