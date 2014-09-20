//
//  ImagePagingScrollView.swift
//  RotateScreenPractice
//
//  Created by Daiwei on 9/19/14.
//  Copyright (c) 2014 Daiwei Lu. All rights reserved.
//

import UIKit

let IMAGE_PADDING = CGFloat(15)

class ImagePagingScrollView: UIScrollView {

    var images: [UIImage]
    var imageZoomViews: [ImageZoomView] = []
    var imageZoomViewLeftConstrains: [NSLayoutConstraint] = []
    var contentView: UIView = UIView()

    init(images: [UIImage], frame: CGRect) {
        self.images = images

        super.init(frame: frame)

        self.pagingEnabled = true

        contentView.frame = CGRect(x: 0,
                                   y: 0,
                               width: frame.width * CGFloat(images.count),
                              height: frame.height)

        self.addSubview(contentView)

        contentSize = contentView.frame.size

        contentView.setTranslatesAutoresizingMaskIntoConstraints(false)

        addConstraints([
            NSLayoutConstraint(
                item: contentView,
                attribute: NSLayoutAttribute.Height,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self,
                attribute: NSLayoutAttribute.Height,
                multiplier: 1,
                constant: 0),
            NSLayoutConstraint(
                item: contentView,
                attribute: NSLayoutAttribute.Width,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self,
                attribute: NSLayoutAttribute.Width,
                multiplier: CGFloat(images.count),
                constant: 0)
        ])

        for (i, image) in enumerate(self.images) {

            var x = leftMarginForImageZoonView(i)
            var width = contentView.frame.width / 3 - 2 * IMAGE_PADDING
            var frame = CGRect(x: x, y: 0, width: width, height: contentView.frame.height)
            var view = ImageZoomView(image: image, frame: frame)

            imageZoomViews.append(view)

            contentView.addSubview(view)

            view.setTranslatesAutoresizingMaskIntoConstraints(false)

            contentView.addConstraints([
                NSLayoutConstraint(
                    item: view,
                    attribute: NSLayoutAttribute.Height,
                    relatedBy: NSLayoutRelation.Equal,
                    toItem: contentView,
                    attribute: NSLayoutAttribute.Height,
                    multiplier: 1,
                    constant: 0),
                NSLayoutConstraint(
                    item: view,
                    attribute: NSLayoutAttribute.Width,
                    relatedBy: NSLayoutRelation.Equal,
                    toItem: contentView,
                    attribute: NSLayoutAttribute.Width,
                    multiplier: 1 / CGFloat(images.count),
                    constant: -2 * IMAGE_PADDING),
                NSLayoutConstraint(
                    item: view,
                    attribute: NSLayoutAttribute.Top,
                    relatedBy: NSLayoutRelation.Equal,
                    toItem: contentView,
                    attribute: NSLayoutAttribute.Top,
                    multiplier: 0,
                    constant: 0)
            ])

            var leftConstraint = NSLayoutConstraint(
                item: view,
                attribute: NSLayoutAttribute.Left,
                relatedBy: NSLayoutRelation.Equal,
                toItem: contentView,
                attribute: NSLayoutAttribute.Left,
                multiplier: 0,
                constant: leftMarginForImageZoonView(i))

            imageZoomViewLeftConstrains.append(leftConstraint)

            contentView.addConstraint(leftConstraint)
        }

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "orientationChanged:", name: UIDeviceOrientationDidChangeNotification, object: nil)
    }

    override func updateConstraints() {
        super.updateConstraints()

        for (i, constraint) in enumerate(imageZoomViewLeftConstrains) {
            constraint.constant = leftMarginForImageZoonView(i)
        }
        contentSize = CGSize(width: frame.width * CGFloat(images.count), height: frame.height)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame.origin = CGPoint(x: 0, y: 0)
    }

    func orientationChanged(note: NSNotification) {
        self.setNeedsUpdateConstraints()
    }

    func leftMarginForImageZoonView(i: Int) -> CGFloat {
        return contentView.frame.width / CGFloat(images.count) * CGFloat(i) + IMAGE_PADDING
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
