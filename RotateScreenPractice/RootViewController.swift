//
//  RootViewController.swift
//  RotateScreenPractice
//
//  Created by Daiwei on 9/16/14.
//  Copyright (c) 2014 Daiwei Lu. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    lazy var container: ThumbnailsContainerView = ThumbnailsContainerView(frame: CGRect(x: 10, y: 30, width: 300, height: 200))

    lazy var images: [UIImage] = [UIImage(named: "wide"), UIImage(named: "high"), UIImage(named: "square")]

    lazy var imageViews: [ThumbnailImageView] = {

        var wide = ThumbnailImageView(image: self.images[0],
            frame: CGRect(x: 0, y: 0, width: 148, height: 200),
            roundingCorners: UIRectCorner.TopLeft | UIRectCorner.BottomLeft)

        var high = ThumbnailImageView(image: self.images[1],
            frame: CGRect(x: 152, y: 0, width: 148, height: 98),
            roundingCorners: UIRectCorner.TopRight)

        var square = ThumbnailImageView(image: self.images[2],
            frame: CGRect(x: 152, y: 102, width: 148, height: 98),
            roundingCorners: UIRectCorner.BottomRight)

        wide.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "receiveGesture:"))
        high.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "receiveGesture:"))
        square.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "receiveGesture:"))

        return [wide, high, square]
    }()

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        container.addSubviews(imageViews)
        self.view.addSubview(container)
    }

    func receiveGesture(recognizer: UIGestureRecognizer) {
        var viewController = LightboxViewController()
        viewController.images = self.images
        viewController.currentIndex = find(imageViews, recognizer.view as ThumbnailImageView)!
        self.presentViewController(viewController, animated: true, completion: nil)
    }
}
