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

    @IBOutlet weak var lihatRngkasanBtn: UIButton!
    @IBOutlet weak var selesaiBtn: UIButton!
        
    @IBOutlet weak var kesimpulanTV: UITableView!
    
//    let kesimpulan:[kesimpulanDetail] = [kesimpulanDetail(title: "Jumlah hutang pajak", detail: "Rp 4.800.000.000"), kesimpulanDetail(title: "Pajak yang sudah dibayar", detail: "Rp 4.000.000.000"), kesimpulanDetail(title: "Status SPT", detail: "Kurang Bayar"), kesimpulanDetail(title: "Jumlah status SPT", detail: "Rp 800.000.000")]
    
    let sectionTitle:[String] = ["Jumlah hutang pajak", "Pajak yang sudah dibayar", "Status SPT", "Jumlah status SPT"]
    
    let sectionDetail:[String] = ["Rp 4.800.000.000", "Rp 4.000.000.000", "Kurang Bayar", "Rp 800.000.000"]
    
    let sectionInfo:[String] = ["Jumlah hutang pajak yang belum kamu bayarkan ke negara.", "Jumlah bukti potong pajak yang sudah kamu lampirkan.", "Status SPT anda sebagai wajib pajak saat ini.", "Jumlah hutang pajak dikurangi pajak yang sudah dibayar."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kesimpulanTV.delegate = self
        kesimpulanTV.dataSource = self
        
        design()
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
