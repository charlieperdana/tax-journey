//
//  ThankYouController.swift
//  TaxJourney
//
//  Created by Annetta Carolina on 07/04/21.
//

import UIKit

class ThankYouController: UIViewController {

    @IBOutlet weak var thankYouImg: UIImageView!
    @IBOutlet weak var thankYouLabel: UILabel!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnRestart: UIButton!
    
    var spt : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        btnNext.layer.cornerRadius = 10
        btnRestart.layer.borderWidth = 2
        btnRestart.layer.cornerRadius = 10
        btnRestart.layer.borderColor = #colorLiteral(red: 0.1594613791, green: 0.150028497, blue: 0.2833949625, alpha: 1)

        // Do any additional setup after loading the view.
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
