//
//  RootViewController.swift
//  RotateScreenPractice
//
//  Created by Daiwei on 9/16/14.
//  Copyright (c) 2014 Daiwei Lu. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    var container: ThumbnailsContainerView?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        container = ThumbnailsContainerView(frame: CGRect(x: 10, y: 30, width: 300, height: 200))
        self.view.addSubview(container!)

        var wide = ThumbnailImageView(image: UIImage(named: "wide"),
                                      frame: CGRect(x: 0, y: 0, width: 148, height: 200),
                            roundingCorners: UIRectCorner.TopLeft | UIRectCorner.BottomLeft)

        var high = ThumbnailImageView(image: UIImage(named: "high"),
                                      frame: CGRect(x: 152, y: 0, width: 148, height: 98),
                            roundingCorners: UIRectCorner.TopRight)

        var square = ThumbnailImageView(image: UIImage(named: "square"),
                                        frame: CGRect(x: 152, y: 102, width: 148, height: 98),
                              roundingCorners: UIRectCorner.BottomRight)

        container!.addSubviews([wide, high, square])

        container!.transform = CGAffineTransformRotate(container!.transform, 3.14 / 2)

        wide.frame = CGRect(x: 0, y: 50, width: 148, height: 200)
    }

    func roundCornerAnimation() {
        if let container = self.container {
            var maskPath = UIBezierPath(roundedRect: container.layer.bounds,
                byRoundingCorners: UIRectCorner.TopLeft,
                cornerRadii: CGSize(width: 20, height: 20))

            var newPath = UIBezierPath(roundedRect: container.layer.bounds,
                byRoundingCorners: UIRectCorner.TopLeft,
                cornerRadii: CGSize(width: 120, height: 120))

            var maskLayer = CAShapeLayer()
            maskLayer.frame = container.layer.bounds
            maskLayer.path = maskPath.CGPath

            container.layer.mask = maskLayer

            var layerAnimation = CABasicAnimation(keyPath: "path")
            layerAnimation.duration = 1
            layerAnimation.fromValue = maskPath.CGPath
            layerAnimation.toValue = newPath.CGPath
            container.layer.mask.addAnimation(layerAnimation, forKey: "animation")
            (container.layer.mask as CAShapeLayer).path = newPath.CGPath
        }
    }
}
