//
//  RincianPTKPViewController.swift
//  TaxJourney
//
//  Created by Scaltiel Gloria on 07/04/21.
//

import UIKit

class RincianPTKPViewController: UIViewController {

    @IBOutlet weak var StatusKawin: UILabel!
    @IBOutlet weak var JumlahTanggungan: UILabel!
    @IBOutlet weak var pribadiLabel: UILabel!
    @IBOutlet weak var kawinLabel: UILabel!
    @IBOutlet weak var tanggunganLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @objc func miniView() {
            let slideVC = StatusPTKP()
            slideVC.modalPresentationStyle = .custom
            slideVC.transitioningDelegate = self
            self.present(slideVC, animated: true, completion: nil)
        }
    @objc func miniView2() {
            let slideVC = TotalPTKP()
            slideVC.modalPresentationStyle = .custom
            slideVC.transitioningDelegate = self
            self.present(slideVC, animated: true, completion: nil)
        }
    
    @IBAction func infoButtonStatus(_ sender: UIButton) {
        miniView()
    }

    
        @IBAction func infoButtonTotal(_ sender: UIButton) {
        miniView2()
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
extension RincianPTKPViewController: UIViewControllerTransitioningDelegate{
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        PresentationController(presentedViewController: presented, presenting: presenting)
    }
}
