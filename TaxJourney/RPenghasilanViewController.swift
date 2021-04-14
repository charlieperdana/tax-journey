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
    var dataPenghasilan = PenghasilanPertahunData()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        penghasilanSetahun.text = "Sepanjang tahun \(dataPenghasilan.periode), kamu memiliki penghasilan sebesar \(dataPenghasilan.penghasilanTahun)"
        penghasilanNeto1.text = "Karena pekerjaanmu adalah \(dataPenghasilan.pekerjaan), maka NPPN-mu adalah sebesar \(dataPenghasilan.nppn)."
        penghasilanNeto2.text = "Penghasilan netomu didapatkan dari jumlah penghasilan x NPPN, sehingga jumlahnya adalah \(dataPenghasilan.nppn * dataPenghasilan.penghasilanTahun)."
        JumlahPajak.text = "Sementara itu, berdasarkan jumlah PPh Dipotong yang kamu lampirkan dari Bukti Potongmu sepanjang tahun \(dataPenghasilan.periode), kamu sudah membayar pajak sebesar \(dataPenghasilan.jumlahPphPotong.reduce(0, +))."
    }
    @objc func miniView() {
            let slideVC = PenghasilanNettoViewController()
            slideVC.modalPresentationStyle = .custom
            slideVC.transitioningDelegate = self
            self.present(slideVC, animated: true, completion: nil)
        }

    @IBAction func infoButton(_ sender: UIButton) {
        miniView()
        
    }

}

extension RPenghasilanViewController: UIViewControllerTransitioningDelegate{
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        PresentationController(presentedViewController: presented, presenting: presenting)
    }
}
