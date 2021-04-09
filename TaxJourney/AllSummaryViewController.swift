//
//  AllSummaryViewController.swift
//  TaxJourney
//
//  Created by Natalia fellyana Laurensia on 06/04/21.
//

import UIKit

class AllSummaryViewController: UIViewController {

    @IBOutlet weak var penghasilanView: UIView!
    @IBOutlet weak var perhitunganView: UIView!
    @IBOutlet weak var jumlahView: UIView!
    
    @IBOutlet weak var penghasilanLbl: UILabel!
    @IBOutlet weak var perhitunganLbl: UILabel!
    
    @IBOutlet weak var utang1Lbl: UILabel!
    @IBOutlet weak var utang2Lbl: UILabel!
    @IBOutlet weak var utang3Lbl: UILabel!
    @IBOutlet weak var utang4Lbl: UILabel!
    
    @IBOutlet weak var jumlah1Lbl: UILabel!
    @IBOutlet weak var jumlah2Lbl: UILabel!
    @IBOutlet weak var jumlah3Lbl: UILabel!
    @IBOutlet weak var jumlah4Lbl: UILabel!
    @IBOutlet weak var jumlahtotalLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        penghasilanView.layer.cornerRadius = 10
        penghasilanView.clipsToBounds = true
        
        perhitunganView.layer.cornerRadius = 10
        penghasilanView.clipsToBounds = true
        
        jumlahView.layer.cornerRadius = 10
        jumlahView.clipsToBounds = true
    }
    
    @objc func showMiracle() {
            let slideVC = OverlayView()
            slideVC.modalPresentationStyle = .custom
            slideVC.transitioningDelegate = self
            self.present(slideVC, animated: true, completion: nil)
        }
    
    @IBAction func infoBtn(_ sender: Any) {
        showMiracle()
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AllSummaryViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        PresentationController(presentedViewController: presented, presenting: presenting)
    }
}
