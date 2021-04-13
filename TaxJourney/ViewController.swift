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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        initDisplay()
    }
    
    func initDisplay(){
        btnStart.layer.cornerRadius = 10
        btnStart.clipsToBounds = true
    }
    
    @IBAction func startBtnDipTap(_ sender: Any) {
        performSegue(withIdentifier: "toPenghasilanPerTahun", sender: self)
    }
}

