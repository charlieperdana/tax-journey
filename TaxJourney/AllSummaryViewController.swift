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
    
    @IBOutlet weak var penghasilan: UILabel!
    @IBOutlet weak var nppn: UILabel!
    @IBOutlet weak var neto: UILabel!
    
    @IBOutlet weak var tanggungan: UILabel!
    @IBOutlet weak var penghasilanKenaPajak: UILabel!
    
    @IBOutlet weak var utang1Lbl: UILabel!
    @IBOutlet weak var utang2Lbl: UILabel!
    @IBOutlet weak var utang3Lbl: UILabel!
    @IBOutlet weak var utang4Lbl: UILabel!
    
    @IBOutlet weak var jumlah1Lbl: UILabel!
    @IBOutlet weak var jumlah2Lbl: UILabel!
    @IBOutlet weak var jumlah3Lbl: UILabel!
    @IBOutlet weak var jumlah4Lbl: UILabel!
    @IBOutlet weak var jumlahtotalLbl: UILabel!
    
    var data2 = PenghasilanPertahunData()
    var totalNeto : Int = 0
    var totalpenghasilan : Int = 0
    var totalnppn : Int = 0
    
    var cekkawin = CheckKawin()
    var cektanggungan = CheckTanggungan()
    var kawin : String!
    var jmlhtanggungan : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        penghasilanView.layer.cornerRadius = 10
        penghasilanView.clipsToBounds = true
        
        perhitunganView.layer.cornerRadius = 10
        penghasilanView.clipsToBounds = true
        
        jumlahView.layer.cornerRadius = 10
        jumlahView.clipsToBounds = true
        
        showDetail()
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
    
    func cek() {
        if cekkawin.isMenikah == true {
            kawin = "sudah menikah"
        }
        else{
            kawin = "belum menikah"
        }
        
        if cektanggungan.jumlahTanggungan >= 3 {
            jmlhtanggungan = 3
        }
        else{
            jmlhtanggungan = cektanggungan.jumlahTanggungan
        }
    }
    
    func showDetail() {
        
        cek()
        
        let totalpenghasilan = data2.penghasilanTahun
        print(totalpenghasilan)
        let totalnppn = data2.nppn / 100
        print(totalnppn)
        totalNeto = totalpenghasilan * totalnppn
        
        penghasilan.text = "Sepanjang tahun \(data2.periode), kamu memiliki penghasilan sebesar Rp \(data2.penghasilanTahun)."
        nppn.text = "Karena pekerjaanmu \(data2.pekerjaan), maka NPPN-mu adalah sebesar \(data2.nppn)%."
        neto.text = "Dengan begitu, kamu memiliki penghasilan neto sebesar Rp \(data2.penghasilanTahun) * \(data2.nppn)% = Rp \(totalNeto)."
        
        tanggungan.text = "Karena kamu \(kawin!) dan memiliki \(jmlhtanggungan) orang tanggungan, maka jumlah PTKP-mu berjumlah RpXXX.XXX"
        penghasilanKenaPajak.text = "Penghasilanmu yang dikenai pajak RpXXX.XXX - RpXXX.XXX = RpXXX.XXX"
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
