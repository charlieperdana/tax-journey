//
//  RPenghasilanViewController.swift
//  TaxJourney
//
//  Created by Scaltiel Gloria on 06/04/21.
//
//
import UIKit

class RPenghasilanViewController: UIViewController {
//    let info = UIImage(systemName: "info.circle")
    @IBOutlet weak var penghasilanSetahun: UILabel!
    @IBOutlet weak var penghasilanNeto1: UILabel!
    @IBOutlet weak var penghasilanNeto2: UILabel!
    @IBOutlet weak var JumlahPajak: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @objc func miniView() {
            let slideVC = OverlayView()
            slideVC.modalPresentationStyle = .custom
            slideVC.transitioningDelegate = self
            self.present(slideVC, animated: true, completion: nil)
        }

    @IBAction func infoButton(_ sender: UIButton) {
        miniView()
        
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

extension RPenghasilanViewController: UIViewControllerTransitioningDelegate{
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        PresentationController(presentedViewController: presented, presenting: presenting)
    }
}
