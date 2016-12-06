//
//  LoginAnimationController.swift
//  SayCheese
//
//  Created by vincent on 05/12/2016.
//  Copyright © 2016 kodappy. All rights reserved.
//

import UIKit

class LoginAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
//        guard let fromVC = transitionContext.viewController(forKey: .from), let toVC = transitionContext.viewController(forKey: .to) else {
//            return
//        }
//        
//        var originFrame = CGRect.zero
//        
//        let containerView = transitionContext.containerView
//        let initialFrame = originFrame
//        let finalFrame = transitionContext.finalFrame(for: toVC)
//        
//        guard let snapshot = toVC.view.snapshotView(afterScreenUpdates: true) else {
//            return
//        }
//        
//        snapshot.frame = initialFrame
//        
//        containerView.addSubview(toVC.view)
//        containerView.addSubview(snapshot)
//    

    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2.0
    }
}
