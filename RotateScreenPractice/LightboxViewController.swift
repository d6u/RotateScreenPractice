//
//  File.swift
//  RotateScreenPractice
//
//  Created by Daiwei on 9/18/14.
//  Copyright (c) 2014 Daiwei Lu. All rights reserved.
//

import UIKit

class LightboxViewController: UIViewController, UIScrollViewDelegate {

    var images: [UIImage]?
    var currentIndex: Int?

    var scrollView: ImagePagingScrollView?

    func setup(images: [UIImage], currentIndex: Int) {
        self.images = images
        self.currentIndex = currentIndex
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        var frame = CGRect(x: -15, y: 0, width: view.frame.width + 30, height: view.frame.height)

        scrollView = ImagePagingScrollView(images: images!, frame: frame)

        if let sv = scrollView {
            view.addSubview(sv)

            sv.setTranslatesAutoresizingMaskIntoConstraints(false)

            view.addConstraints([
                NSLayoutConstraint(
                    item: sv,
                    attribute:
                    NSLayoutAttribute.Height,
                    relatedBy: NSLayoutRelation.Equal,
                    toItem: view,
                    attribute: NSLayoutAttribute.Height,
                    multiplier: 1,
                    constant: 0),
                NSLayoutConstraint(
                    item: sv,
                    attribute: NSLayoutAttribute.Width,
                    relatedBy: NSLayoutRelation.Equal,
                    toItem: view,
                    attribute: NSLayoutAttribute.Width,
                    multiplier: 1,
                    constant: 30),
                NSLayoutConstraint(
                    item: sv,
                    attribute: NSLayoutAttribute.Top,
                    relatedBy: NSLayoutRelation.Equal,
                    toItem: view,
                    attribute: NSLayoutAttribute.Top,
                    multiplier: 0,
                    constant: 0),
                NSLayoutConstraint(
                    item: sv,
                    attribute: NSLayoutAttribute.Left,
                    relatedBy: NSLayoutRelation.Equal,
                    toItem: view,
                    attribute: NSLayoutAttribute.Left,
                    multiplier: 0,
                    constant: -15)
            ])

            println("LightboxViewController.scrollView.frame = \(sv.frame)")
            println("LightboxViewController.view.frame = \(view.frame)")
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        println("LightboxViewController.scrollView.frame = \(scrollView?.frame)")
        println("LightboxViewController.view.frame = \(view.frame)")
    }
}
