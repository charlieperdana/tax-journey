//
//  KesimpulanViewController.swift
//  TaxJourney
//
//  Created by Natalia fellyana Laurensia on 07/04/21.
//

import UIKit

//struct kesimpulanDetail {
//    var title: String?
//    var detail: String?
//}

class KesimpulanViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var miniKesimpulanView: UIView!
    @IBOutlet weak var lihatRngkasanBtn: UIButton!
    @IBOutlet weak var selesaiBtn: UIButton!
    @IBOutlet weak var miniKesimpulan: UILabel!
    @IBOutlet weak var kesimpulanTV: UITableView!
    
    var cekKawin = CheckKawin()
    var cekTanggungan = CheckTanggungan()
    var data = PenghasilanPertahunData()
    var totalutang : Int = 0
    
//    let kesimpulan:[kesimpulanDetail] = [kesimpulanDetail(title: "Jumlah hutang pajak", detail: "Rp 4.800.000.000"), kesimpulanDetail(title: "Pajak yang sudah dibayar", detail: "Rp 4.000.000.000"), kesimpulanDetail(title: "Status SPT", detail: "Kurang Bayar"), kesimpulanDetail(title: "Jumlah status SPT", detail: "Rp 800.000.000")]
    
    //let sectionTitle:[String] = ["Jumlah hutang pajak", "Pajak yang sudah dibayar", "Status SPT", "Jumlah status SPT"]
    var sectionTitle:[String] = []
    
    //let sectionDetail:[String] = ["Rp 4.800.000.000", "Rp 4.000.000.000", "Kurang Bayar", "Rp 800.000.000"]
    
    let sectionInfo:[String] = ["Jumlah hutang pajak yang belum kamu bayarkan ke negara.", "Jumlah bukti potong pajak yang sudah kamu lampirkan.", "Status SPT anda sebagai wajib pajak saat ini.", "Jumlah hutang pajak dikurangi pajak yang sudah dibayar."]
    
    var sectionDetail:[String] = []
    var statusspt:String!
    var jumlahstatusspt:Int = 0
    //var jmlhutng : cekjumlahtotal!
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
    var jmlhtotalutang : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kesimpulanTV.delegate = self
        kesimpulanTV.dataSource = self
        design()
        hitung()
        
        totalutang = jmlhtotalutang
        var pajakDibayar : Int = 0
        
        for i in data.jumlahPphPotong{
            pajakDibayar = pajakDibayar+i
        }
        
        jumlahstatusspt = totalutang - pajakDibayar
        
        if jumlahstatusspt < 0 {
            statusspt = "Lebih Bayar"
            jumlahstatusspt = jumlahstatusspt * -1
        } else if jumlahstatusspt == 0 {
            statusspt = "Nihil"
        } else if jumlahstatusspt > 0 {
            statusspt = "Kurang Bayar"
        }
        
        sectionDetail = ["Rp\(totalutang)", "Rp\(pajakDibayar)", "\(statusspt!)", "Rp\(jumlahstatusspt)"]
        sectionTitle = ["Jumlah hutang pajak", "Pajak yang sudah dibayar", "Status SPT", "Jumlah \(statusspt!)"]
        
        miniKesimpulan.text = "Berdasarkan perhitungan di atas, kamu masih harus membayar pajak sebesar Rp. \(jumlahstatusspt)"
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = kesimpulanTV.dequeueReusableCell(withIdentifier: "kesimpulanCell") as! KesimpulanTableViewCell
//        let ksmpln = kesimpulan[indexPath.row]
        cell.title.text = sectionTitle[indexPath.section]
        cell.detail.text = sectionDetail[indexPath.section]
        
//        cell.accessoryType = .detailButton
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let infocell = kesimpulanTV.dequeueReusableCell(withIdentifier: "infoCell") as! InfoTableViewCell
        
        infocell.detailInfo.text = sectionInfo[section]
        
        return infocell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
    }
    
    func design() {
        
        lihatRngkasanBtn.layer.cornerRadius = 10
        lihatRngkasanBtn.clipsToBounds = true
        lihatRngkasanBtn.layer.borderWidth = 2
        lihatRngkasanBtn.layer.borderColor = #colorLiteral(red: 0.2082082033, green: 0.2140741646, blue: 0.3454431593, alpha: 1)
        
        selesaiBtn.layer.cornerRadius = 10
        selesaiBtn.clipsToBounds = true
        
        miniKesimpulanView.layer.cornerRadius = 10
        miniKesimpulanView.clipsToBounds = true
        
    }
    
    @objc func showMiracle() {
            let slideVC = Overlay2View()
            slideVC.modalPresentationStyle = .custom
            slideVC.transitioningDelegate = self
            self.present(slideVC, animated: true, completion: nil)
        }
    
    @IBAction func sptInfoBtn(_ sender: Any) {
        showMiracle()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAllSummary"{
            let dest = segue.destination as? AllSummaryViewController
            dest?.data2 = data
            dest?.cekkawin = cekKawin
            dest?.cektanggungan = cekTanggungan
        }
        if segue.identifier == "toThankyou" {
            let dest = segue.destination as? ThankYouController
            dest?.spt = statusspt
        }
    }
    
    func hitung() {
        
        var ptkp = 54000000
        var tambahanptkp = 4500000
        var x = 100
        
        totalpenghasilan = data.penghasilanTahun
        print(totalpenghasilan)
        totalnppn = data.nppn
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension KesimpulanViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        PresentationController(presentedViewController: presented, presenting: presenting)
    }
}
