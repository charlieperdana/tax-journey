//
//  ViewController.swift
//  TaxJourney
//
//  Created by charlie siagian on 06/04/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var haiLabel: UILabel!
    @IBOutlet weak var btnStart: UIButton!
    @IBOutlet weak var imgLogo: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        initDisplay()
    }
    
    func initDisplay(){
        btnStart.layer.cornerRadius = 10
        btnStart.clipsToBounds = true
        
//        imgLogo.backgroundColor = .clear
//        imgLogo.layer.cornerRadius = 10
//        imgLogo.layer.borderWidth = 1
//        imgLogo.layer.borderColor = UIColor.black.cgColor
//        imgLogo.center = self.view.center
    }
    
    @IBAction func startBtnDipTap(_ sender: Any) {
        performSegue(withIdentifier: "toPenghasilanPerTahun", sender: self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
}

