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
    @IBOutlet weak var kawinLabel: UILabel!
    @IBOutlet weak var tanggunganLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var angkaTanggungan: UILabel!
    @IBOutlet weak var statusPTKP: UILabel!
    
    
    var cekKawin = CheckKawin()
    var cekTanggungan = CheckTanggungan()
    var kelamin: String = ""
    var menikah: String = ""
    var suamiBerpenghasilan: String = ""
    var jumlahAngkaTanggungan: Int = 0
    func changeTrueOrFalse() {
        kelamin = cekKawin.kelamin
        if cekKawin.isMenikah == true{
            menikah = "sudah menikah"
        }else{
            menikah = "belum menikah"
        }
        if cekTanggungan.jumlahTanggungan > 3 {
            jumlahAngkaTanggungan = 3
        }else{
            jumlahAngkaTanggungan = cekTanggungan.jumlahTanggungan
        }
        
        if cekKawin.isSuamiBerpenghasilan == true {
            suamiBerpenghasilan = "suami kamu berpenghasilan."
        }else{
            suamiBerpenghasilan = "suami kamu tidak berpenghasilan."
        }
        
       
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        changeTrueOrFalse()
        if kelamin == "Laki-laki" {
            StatusKawin.text = "Status kamu saat ini adalah \(kelamin) yang \(menikah)"
        }else{
            if cekKawin.isNPWPdigabung == true {
                StatusKawin.text = "Status kamu saat ini adalah \(kelamin) yang \(menikah)."
            }else{
                StatusKawin.text = "Status kamu saat ini adalah \(kelamin) yang \(menikah), dan \(suamiBerpenghasilan)"
            }
            
        }
        JumlahTanggungan.text = "Jumlah tanggungan kamu saat ini adalah \(jumlahAngkaTanggungan) orang"
        statusPTKP.text = "Berdasarkan status perkawinan dan jumlah tanggunganmu, status PTKP-mu adalah K/\(jumlahAngkaTanggungan)."
        if menikah == "sudah menikah"{
            kawinLabel.text = "Rp4.500.000"
        }else{
            kawinLabel.text = "Rp0"
        }
        if cekTanggungan.jumlahTanggungan == 0 {
            tanggunganLabel.text = "Rp0"
        }else if cekTanggungan.jumlahTanggungan == 1 {
            tanggunganLabel.text = "Rp4.500.000"
        }else if cekTanggungan.jumlahTanggungan == 2{
            tanggunganLabel.text = "Rp9.000.000"
        }else{
            tanggunganLabel.text = "Rp13.500.000"
        }
        angkaTanggungan.text = String("Tanggungan(\(cekTanggungan.jumlahTanggungan))")
        if cekKawin.isMenikah == false {
            totalLabel.text = "Rp54.000.000"
        }else if cekKawin.isMenikah == true{
            switch cekTanggungan.jumlahTanggungan {
            case 0:
                totalLabel.text = "Rp.58.500.000"
            case 1:
                totalLabel.text = "Rp.63.000.000"
            case 2:
                totalLabel.text = "Rp.67.500.000"
            case 3:
                totalLabel.text = "Rp.72.000.000"
            default:
                return
            }
            
        }
        
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


}
extension RincianPTKPViewController: UIViewControllerTransitioningDelegate{
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        PresentationController(presentedViewController: presented, presenting: presenting)
    }
}
