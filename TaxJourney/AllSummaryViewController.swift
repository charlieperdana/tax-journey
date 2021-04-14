//
//  AllSummaryViewController.swift
//  TaxJourney
//
//  Created by Natalia fellyana Laurensia on 06/04/21.
//

import UIKit

public var jmlhtotalutang : Int = 0

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
    var jmlhptkp : Int = 0
    var besaranptkp : Int = 0
    var pkprounded : Int = 0
    var pkproundseribu : Int = 0
    var besaranpkp : Int = 0
    var total5 : Int = 0
    var total15 : Int = 0
    var total25 : Int = 0
    var total30 : Int = 0
    var jmlhtotal1 : Int = 0
    var jmlhtotal2 : Int = 0
    var jmlhtotal3 : Int = 0
    var jmlhtotal4 : Int = 0
    
    
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
        
        var ptkp = 54000000
        var tambahanptkp = 4500000
        var x = 100
        
        totalpenghasilan = data2.penghasilanTahun
        print(totalpenghasilan)
        totalnppn = data2.nppn
        print(totalnppn)
        totalNeto = totalpenghasilan * totalnppn / x
        print(totalNeto)
        
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
        
        if jmlhtanggungan <= 3 {
            jmlhptkp = ptkp + (tambahanptkp * jmlhtanggungan)
        }
        
        besaranptkp = jmlhptkp
        
        pkprounded = totalNeto - besaranptkp
        
        pkproundseribu = (pkprounded / 1000) * 1000
        
        besaranpkp = pkproundseribu
        
        if besaranpkp <= 50000000 {
            total5 = besaranPKP
        } else if besaranpkp <= 250000000 {
            total5 = 50000000
            total15 = besaranpkp - 50000000
        } else if besaranpkp <= 500000000 {
            total5 = 50000000
            total15 = 200000000
            total25 = besaranpkp - 250000000
        } else {
            total5 = 50000000
            total15 = 200000000
            total25 = 250000000
            total30 = besaranpkp - 500000000
        }
        
        jmlhtotalutang = (total5 * 5/100 + total15 * 15/100 + total25 * 25/100 + total30 * 30/100)
        
    }
    
    func showDetail() {
        
        cek()
        
        penghasilan.text = "Sepanjang tahun \(data2.periode), kamu memiliki penghasilan sebesar Rp \(data2.penghasilanTahun)."
        nppn.text = "Karena pekerjaanmu \(data2.pekerjaan), maka NPPN-mu adalah sebesar \(data2.nppn)%."
        neto.text = "Dengan begitu, kamu memiliki penghasilan neto sebesar Rp \(data2.penghasilanTahun) * \(data2.nppn)% = Rp \(totalNeto)."
        
        tanggungan.text = "Karena kamu \(kawin!) dan memiliki \(jmlhtanggungan) orang tanggungan, maka jumlah PTKP-mu berjumlah Rp \(jmlhptkp)"
        penghasilanKenaPajak.text = "Penghasilanmu yang dikenai pajak Rp \(totalNeto) - Rp \(besaranptkp) = Rp \(pkprounded)"
        
        utang1Lbl.text = "5% x Rp \(total5)"
        utang2Lbl.text = "15% x Rp \(total15)"
        utang3Lbl.text = "25% x Rp \(total25)"
        utang4Lbl.text = "30% x Rp \(total30)"
        
        jumlah1Lbl.text = "Rp \(total5 * 5 / 100)"
        jumlah2Lbl.text = "Rp \(total15 * 15 / 100)"
        jumlah3Lbl.text = "Rp \(total25 * 25 / 100)"
        jumlah4Lbl.text = "Rp \(total30 * 30 / 100)"
        jumlahtotalLbl.text = "Rp \(jmlhtotalutang)"
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

//if menikah == "sudah menikah"{
//    kawinLabel.text = "Rp4.500.000"
//}else{
//    kawinLabel.text = "Rp0"
//}
//if cekTanggungan.jumlahTanggungan == 0 {
//    tanggunganLabel.text = "Rp0"
//}else if cekTanggungan.jumlahTanggungan == 1 {
//    tanggunganLabel.text = "Rp4.500.000"
//}else if cekTanggungan.jumlahTanggungan == 2{
//    tanggunganLabel.text = "Rp9.000.000"
//}else{
//    tanggunganLabel.text = "Rp13.500.000"
//}
//angkaTanggungan.text = String("Tanggungan(\(cekTanggungan.jumlahTanggungan))")
//if cekKawin.isMenikah == false {
//    totalLabel.text = "Rp54.000.000"
//}else if cekKawin.isMenikah == true{
//    switch cekTanggungan.jumlahTanggungan {
//    case 0:
//        totalLabel.text = "Rp.58.500.000"
//    case 1:
//        totalLabel.text = "Rp.63.000.000"
//    case 2:
//        totalLabel.text = "Rp.67.500.000"
//    case 3:
//        totalLabel.text = "Rp.72.000.000"
//    default:
//        return
//    }
//
//}
