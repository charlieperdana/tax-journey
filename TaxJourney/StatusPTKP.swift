//
//  StatusPTKPView.swift
//  TaxJourney
//
//  Created by Scaltiel Gloria on 07/04/21.
//

import UIKit

class StatusPTKP: UIViewController {
    
    var hasSetPointOrigin = false
    var pointOrigin: CGPoint?
        
    @IBOutlet weak var closeButton: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // adding gesture when user slide the mini view
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizerAction))
        view.addGestureRecognizer(panGesture)
        closeButton.roundCorners(.allCorners, radius: 10)
        //slideIdicator1.roundCorners(.allCorners, radius: 10)
    }
    // initial point where the view should be located
    override func viewDidLayoutSubviews() {
        if !hasSetPointOrigin {
            hasSetPointOrigin = true
            pointOrigin = self.view.frame.origin
        }
    }
    @objc func panGestureRecognizerAction(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        // Not allowing the user to drag the view upward
        guard translation.y >= 0 else { return }
        
        // setting x as 0 because we don't want users to move the frame side ways!! Only want straight up or down
        view.frame.origin = CGPoint(x: 0, y: self.pointOrigin!.y + translation.y)
        
        if sender.state == .ended {
            let dragVelocity = sender.velocity(in: view)
            if dragVelocity.y >= 1300 {
                self.dismiss(animated: true, completion: nil)
            } else {
                // Set back to original position of the view controller
                UIView.animate(withDuration: 0.3) {
                    self.view.frame.origin = self.pointOrigin ?? CGPoint(x: 0, y: 400)
                }
            }
        }
    }
}
