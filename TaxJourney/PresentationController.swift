//
//  PresentationController.swift
//  TaxJourney
//
//  Created by Scaltiel Gloria on 06/04/21.
//

import UIKit

class PresentationController: UIPresentationController {

  let blurEffectView: UIVisualEffectView! // for blur
  var tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer()
  
    // handle transaction between two viewController
  override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
      let blurEffect = UIBlurEffect(style: .dark)
      blurEffectView = UIVisualEffectView(effect: blurEffect)
      super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
      tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissController))
      blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
      self.blurEffectView.isUserInteractionEnabled = true
      self.blurEffectView.addGestureRecognizer(tapGestureRecognizer)
  }
  // for the frame size
  override var frameOfPresentedViewInContainerView: CGRect {
      CGRect(origin: CGPoint(x: 0, y: self.containerView!.frame.height * 0.5),
             size: CGSize(width: self.containerView!.frame.width, height: self.containerView!.frame.height *
              0.7))
  }
// for blurring
  override func presentationTransitionWillBegin() {
      self.blurEffectView.alpha = 0
      self.containerView?.addSubview(blurEffectView)
      self.presentedViewController.transitionCoordinator?.animate(alongsideTransition: { (UIViewControllerTransitionCoordinatorContext) in
          self.blurEffectView.alpha = 0.7
      }, completion: { (UIViewControllerTransitionCoordinatorContext) in })
  }
  
  override func dismissalTransitionWillBegin() {
      self.presentedViewController.transitionCoordinator?.animate(alongsideTransition: { (UIViewControllerTransitionCoordinatorContext) in
          self.blurEffectView.alpha = 0
      }, completion: { (UIViewControllerTransitionCoordinatorContext) in
          self.blurEffectView.removeFromSuperview()
      })
  }
  // make the screen rounded corner
  override func containerViewWillLayoutSubviews() {
      super.containerViewWillLayoutSubviews()
    presentedView!.roundCorners([.topLeft, .topRight], radius: 22)
  }
// layout display on the containerView
  override func containerViewDidLayoutSubviews() {
      super.containerViewDidLayoutSubviews()
      presentedView?.frame = frameOfPresentedViewInContainerView
      blurEffectView.frame = containerView!.bounds
  }
// to hide our view by triggering our view that have tapGesture
  @objc func dismissController(){
      self.presentedViewController.dismiss(animated: true, completion: nil)
  }
}
// extention to make the roundCorner
extension UIView {
  func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
      let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners,
                              cornerRadii: CGSize(width: radius, height: radius))
      let mask = CAShapeLayer()
      mask.path = path.cgPath
      layer.mask = mask
  }
}
