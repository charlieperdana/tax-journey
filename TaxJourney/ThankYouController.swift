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
    var linkNext : String!
    
    @IBAction func btnNextTapped(_ sender: Any) {
        
        guard let url = URL(string: linkNext) else { return }
        UIApplication.shared.open(url)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        btnNext.layer.cornerRadius = 10
        btnRestart.layer.borderWidth = 2
        btnRestart.layer.cornerRadius = 10
        btnRestart.layer.borderColor = #colorLiteral(red: 0.1594613791, green: 0.150028497, blue: 0.2833949625, alpha: 1)

        cekSPT()
        // Do any additional setup after loading the view.
    }
    
    func cekSPT() {
        if spt == "Lebih Bayar"
        {
            thankYouLabel.text = "Jangan lupa, kamu bisa mengajukan pengembalian untuk kelebihan pembayaran pajakmu loh! Untuk tata caranya, kamu bisa klik tombol 'Cara Mengajukan Pengembalian' di bawah ini."
            btnNext.setTitle("Cara Mengajukan Pengembalian", for: .normal)
            linkNext = "https://www.pajak.go.id/id/restitusi"
            thankYouImg.image = UIImage(named: "LebihBayar")
        }
        else if spt == "Nihil"
        {
            thankYouLabel.text = "Terima kasih juga sudah membayarkan pajakmu sesuai jumlah yang benar! Setelah ini, jangan lupa untuk melaporkan SPT-mu ya. Untuk tata cara pelaporan SPT, kamu bisa klik tombol 'Cara Lapor SPT' di bawah ini."
            btnNext.setTitle("Cara Lapor SPT", for: .normal)
            linkNext = "https://www.pajak.go.id/id/artikel/e-filing-lapor-pajak-cukup-dua-menit"
            thankYouImg.image = UIImage(named: "Nihil")
        }
        else if spt == "Kurang Bayar"
        {
            thankYouLabel.text = "Setelah ini, jangan lupa untuk membayar kekurangan pajakmu ya. Untuk tata cara pembayarannya, kamu bisa klik tombol 'Cara Bayar Pajak' di bawah ini."
            btnNext.setTitle("Cara Bayar Pajak", for: .normal)
            linkNext = "https://www.pajak.go.id/id/pembayaran-pajak-menggunakan-e-billing"
            thankYouImg.image = UIImage(named: "KurangBayar")
        }
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
