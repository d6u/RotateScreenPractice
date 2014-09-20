//
//  TransitionAnimator.swift
//  RotateScreenPractice
//
//  Created by Daiwei on 9/18/14.
//  Copyright (c) 2014 Daiwei Lu. All rights reserved.
//

import UIKit

class TransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.1
    }

    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {

    }
}
