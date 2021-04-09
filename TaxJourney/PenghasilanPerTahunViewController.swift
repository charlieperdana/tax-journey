//
//  PenghasilanPerTahunViewController.swift
//  TaxJourney
//
//  Created by charlie siagian on 06/04/21.
//

import UIKit

class PenghasilanPerTahunViewController: UIViewController{
    
    @IBOutlet weak var tablePenghasilanView: UITableView!
    
    @IBOutlet weak var btnLihatRincian: UIButton!
    
    @IBOutlet weak var btnLanjut: UIButton!
    
    
    let yearPicker = UIPickerView()
    

    var item: [ListPenghasilanItemModel] = [ListPenghasilanItemModel(item: "Periode", detailInfo: "Pilih tahun yang ingin kamu hitung jumlah pajaknya."),ListPenghasilanItemModel(item: "Penghasilan Setahun", detailInfo: "Masukkan penghasilanmu sepanjang tahun diatas"),ListPenghasilanItemModel(item: "Pekerjaan", detailInfo: ""), ListPenghasilanItemModel(item: "NPPN", detailInfo: ""), ListPenghasilanItemModel(item: "Memiliki Bukti Potong", detailInfo: "Bukti Potong adalah bukti bahwa sebagian dari penghasilanmu sudah dipotong untuk pembayaran pajak")]

    var itemJumlahPotong: [JumlahPotongModel] = [JumlahPotongModel(item: "Jumlah pada Bukti Potong 1", jumlah: 0),JumlahPotongModel(item: "Jumlah pada Bukti Potong 2", jumlah: 0)]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnDisplay()

        tablePenghasilanView?.delegate = self
        tablePenghasilanView?.dataSource = self
       
    
    
    }
    
    func btnDisplay(){
        btnLanjut.layer.cornerRadius = 10
        btnLanjut.layer.borderWidth = 2
        
        btnLihatRincian.layer.cornerRadius = 10
        btnLihatRincian.layer.borderWidth = 2
        btnLihatRincian.layer.borderColor = #colorLiteral(red: 0.1594613791, green: 0.150028497, blue: 0.2833949625, alpha: 1)
    }
    
    @IBAction func buttonLanjut(_ sender: Any) {
        performSegue(withIdentifier: "toPTKP", sender: self)
    }
    
}

extension PenghasilanPerTahunViewController: UITableViewDelegate, UITableViewDataSource{
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "listPenghasilanCell", for: indexPath) as! PenghasilanTableViewCell
        
        if indexPath.section == 0{
            
            let items = item[indexPath.row]
            
            cell.itemLabel?.text = items.item
            cell.infoLabel?.text = items.detailInfo
            
        } else if indexPath.section == 1 {
            let items = itemJumlahPotong[indexPath.row]
            
            cell.itemLabel?.text = items.item
            cell.infoLabel?.text = ""
            
        }
        
    
//        let myPicker = UISwitch()
//        myPicker.addTarget(self, action: #selector(didChangeSwitch(_:)), for: .valueChanged)
//        cell.accessoryView = myPicker
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return item.count
        } else if section == 1 {
            return itemJumlahPotong.count
        }
        return item.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
                return "Jumlah PPh Dipotong"
            }
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: tableView.frame.size.height))
        
        if section == 1{
            headerView.backgroundColor = UIColor.lightGray

            let title = UILabel()
            title.translatesAutoresizingMaskIntoConstraints = false
            title.text = "Jumlah PPh Dipotong"
            title.font = UIFont.boldSystemFont(ofSize: 17.0)
            headerView.addSubview(title)

            let button = UIButton(type: .system)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("+", for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            button.addTarget(self, action: #selector(btnAddJumlahPotong), for: .touchUpInside)
            //set backgroung circle
            button.backgroundColor = .clear
            button.layer.cornerRadius = 10
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
//            button.center = self.view.center
            headerView.addSubview(button)

            var headerViews = Dictionary<String, UIView>()
            headerViews["title"] = title
            headerViews["button"] = button
            
            headerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[title]-[button]-45-|", options: [], metrics: nil, views: headerViews))
            headerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[title]-|", options: [], metrics: nil, views: headerViews))
            headerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[button]-|", options: [], metrics: nil, views: headerViews))
            
        }
            
    

            return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 {
            return 50
        } else if indexPath.section == 0 {
            if indexPath.row == 2 || indexPath.row == 3 {
                return 50
            } else if indexPath.row == 4 {
                return 100
            }
        }
        return 85
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    @objc func didChangeSwitch(_ sender: UISwitch){
        if sender.isOn {
            print ("User turned it on")
        }
        else {
            print("it's now off")
        }
    }
    
    @objc func btnAddJumlahPotong(sender: UIButton!) {
      print("Button tapped")
    }
    
}

