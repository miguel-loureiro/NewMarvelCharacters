//
//  FadePushAnimator.swift
//  NewMarvelCharacters
//
//  Created by António Loureiro on 28/02/2024.
//

import Foundation
import UIKit

class FadePushAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    static let duration: CGFloat = 0.1

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return Self.duration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

        guard
            let toViewController = transitionContext.viewController(forKey: .to)
        else {
            return
        }

        transitionContext.containerView.addSubview(toViewController.view)
        toViewController.view.alpha = 0

        let duration = self.transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration, animations: {

            toViewController.view.alpha = 1
        }, completion: { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
}
