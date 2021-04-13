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
    
    var cell =  PenghasilanTableViewCell()

    var item: [ListPenghasilanItemModel] = [ListPenghasilanItemModel(item: "Periode", detailInfo: "Pilih tahun yang ingin kamu hitung jumlah pajaknya."),ListPenghasilanItemModel(item: "Penghasilan Setahun", detailInfo: "Masukkan penghasilanmu sepanjang tahun diatas"),ListPenghasilanItemModel(item: "Pekerjaan", detailInfo: ""), ListPenghasilanItemModel(item: "NPPN", detailInfo: ""), ListPenghasilanItemModel(item: "Memiliki Bukti Potong", detailInfo: "Bukti Potong adalah bukti bahwa sebagian dari penghasilanmu sudah dipotong untuk pembayaran pajak")]

    var itemJumlahPotong: [JumlahPotongModel] = [JumlahPotongModel(item: "Jumlah Bukti Potong 1", jumlah: 0)]
    
    //for custom cell
    var pickerData = [String]()
    let yearPicker = UIPickerView()
    var pickerHaveBukti: UIPickerView!
    var pickerYear: UIPickerView!
    var pickerPekerjaan: UIPickerView!

    
    var yearsTillNow : [String] {
        var years = [String]()
        for i in (1970..<2022).reversed() {
            years.append("\(i)")
        }
        return years
    }
    
    var isBuktiPotong = ["Ya", "Tidak"]
    
    var pekerjaan = ["Desain Grafis", "Jasa Fotografi", "Programmer","Digital Marketer", "Entry Data", "Copywriter", "Penerjemah", "Lainnya"]
    
    var dataPenghasilan = PenghasilanPertahunData()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnDisplay()

        tablePenghasilanView?.delegate = self
        tablePenghasilanView?.dataSource = self
       
        pickerLoadUI()
    
    }
    
    func btnDisplay(){
        btnLanjut.layer.cornerRadius = 10
        btnLanjut.layer.borderWidth = 2
        
        btnLihatRincian.layer.cornerRadius = 10
        btnLihatRincian.layer.borderWidth = 2
        btnLihatRincian.layer.borderColor = #colorLiteral(red: 0.1594613791, green: 0.150028497, blue: 0.2833949625, alpha: 1)
    }
    
    @IBAction func buttonLanjut(_ sender: Any) {
        print("data modelnya \(dataPenghasilan)")
        performSegue(withIdentifier: "toPTKP", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PTKPViewController {
            destination.dataPenghasilanPerTahun = dataPenghasilan
        }
        if let destinationRincian = segue.destination as? RPenghasilanViewController {
            destinationRincian.dataPenghasilan = dataPenghasilan
        }
    }
    
    
}

extension PenghasilanPerTahunViewController: UITableViewDelegate, UITableViewDataSource, UIViewControllerTransitioningDelegate{
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "listPenghasilanCell", for: indexPath) as! PenghasilanTableViewCell
        cell = tableView.dequeueReusableCell(withIdentifier: "listPenghasilanCell", for: indexPath) as! PenghasilanTableViewCell
//        cell.indexPath = indexPath
        cell.fieldPilih.delegate = self
        
        if indexPath.section == 0{
            
            let items = item[indexPath.row]
            
            cell.itemLabel?.text = items.item
            cell.infoLabel?.text = items.detailInfo
        
            
            //for picker cell
            if indexPath.row == 0 {
                cell.fieldPilih.inputView = pickerYear
                cell.fieldPilih.tag = 100
                cell.fieldPilih.text = ""
                cell.fieldPilih.placeholder = "Pilih"
                pickerData = yearsTillNow
            }else if indexPath.row == 4 {
                cell.fieldPilih.inputView = pickerHaveBukti
                cell.fieldPilih.tag = 101
                cell.fieldPilih.text = ""
                cell.fieldPilih.placeholder = "Pilih"
                pickerData = isBuktiPotong
            } else if indexPath.row == 2 {
                cell.fieldPilih.inputView = pickerPekerjaan
                cell.fieldPilih.tag = 102
                cell.fieldPilih.text = ""
                cell.fieldPilih.placeholder = "Pilih"
                pickerData = pekerjaan
            } else if indexPath.row == 1 {
                cell.fieldPilih.tag = 103
                cell.fieldPilih.text = ""
                cell.fieldPilih.placeholder = "Tidak Diatur"
            } else if indexPath.row == 3 {
                cell.fieldPilih.tag = 104
                cell.fieldPilih.text = ""
                cell.fieldPilih.placeholder = "Tidak Diatur"
            } else {
                cell.fieldPilih.text = ""
                cell.fieldPilih.placeholder = "Tidak Diatur"
//                cell.fieldPilih.frame.size.width = 100
            }
            
        } else if indexPath.section == 1 {
            let items = itemJumlahPotong[indexPath.row]
            cell.fieldPilih.tag = 105
//            cell.fieldPilih.addTarget(self, action: #selector(ViewController.textFieldDidChange(_:)), for: .editingChanged)
            
            cell.itemLabel?.text = items.item
            cell.infoLabel?.text = ""
            
            cell.fieldPilih.text = ""
            cell.fieldPilih.placeholder = "Tidak Diatur"
            
        }

//        let myPicker = UISwitch()
//        myPicker.addTarget(self, action: #selector(didChangeSwitch(_:)), for: .valueChanged)
//        cell.accessoryView = myPicker
        
        if indexPath.row == 3 && indexPath.section == 0 {
            let nppnBtn = UIButton(type: .detailDisclosure)
            nppnBtn.frame = CGRect(x: 45, y: 7, width: 80, height: 40)
            nppnBtn.addTarget(self, action: #selector(showNppnHalfModal), for: .touchUpInside)
//            myPicker.addTarget(self, action: #selector(didChangeSwitch(_:)), for: .valueChanged)
//            cell.accessoryView = nppnBtn
            cell.contentView.addSubview(nppnBtn)
        }
        
                
        
        
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

            let button = UIButton(type: .contactAdd)

            button.translatesAutoresizingMaskIntoConstraints = false
//            button.setTitle("+", for: .normal)
//            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            button.addTarget(self, action: #selector(btnAddJumlahPotong), for: .touchUpInside)
            //set backgroung circle
//            button.backgroundColor = .clear
//            button.layer.cornerRadius = 10
//            button.layer.borderWidth = 1
//            button.layer.borderColor = UIColor.black.cgColor
//            button.center = self.view.center
            headerView.addSubview(button)

            var headerViews = Dictionary<String, UIView>()
            headerViews["title"] = title
            headerViews["button"] = button
            
            headerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[title]-[button]-30-|", options: [], metrics: nil, views: headerViews))
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
        let indexPotong = itemJumlahPotong.count
        itemJumlahPotong.append(JumlahPotongModel(item: "Jumlah Bukti Potong \(indexPotong+1)", jumlah: 0))
        tablePenghasilanView.beginUpdates()
        tablePenghasilanView.insertRows(at: [IndexPath(row: itemJumlahPotong.count-1, section: 1)], with: .bottom)
        tablePenghasilanView.endUpdates()
        
    }
    
    
    //for half modal nppn
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        PresentationController(presentedViewController: presented, presenting: presenting)
    }
    
    @objc func showNppnHalfModal(sender: UIButton!) {
        print("nppn tapped")
        let slideNPPN = NppnOverlayView()
        slideNPPN.modalPresentationStyle = .custom
        slideNPPN.transitioningDelegate = self
        self.present(slideNPPN, animated: true, completion: nil)

    }
    
}

extension PenghasilanPerTahunViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    func pickerLoadUI() {
        pickerYear = createPicker()
        pickerYear.tag = 0

        pickerHaveBukti = createPicker()
        pickerHaveBukti.tag = 1
        
        pickerPekerjaan = createPicker()
        pickerPekerjaan.tag = 2
        
    }
    
    func createPicker() -> UIPickerView {
        let picker = UIPickerView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        picker.dataSource = self
        picker.delegate = self
        picker.backgroundColor = .white
        return picker
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return yearsTillNow.count
//        return pickerData.count
        var maxData = 0
        switch pickerView.tag {
        case 0:
            maxData = yearsTillNow.count
        case 1:
            maxData = isBuktiPotong.count
        case 2:
            maxData = pekerjaan.count
        default:
            maxData = pickerData.count
        }
        
        return maxData
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return yearsTillNow[row]
        switch pickerView.tag {
        case 0:
            pickerData = yearsTillNow
        case 1:
            pickerData = isBuktiPotong
        case 2:
            pickerData = pekerjaan
        default:
            pickerData = ["", ""]
        }
        
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        cell.fieldPilih.text = pickerData[row]
//        cell.fieldPilih.resignFirstResponder()
        switch pickerView.tag {
        case 0:
            let mytextfield = self.view.viewWithTag(100) as! UITextField
            mytextfield.text = pickerData[row]
            mytextfield.resignFirstResponder()
            dataPenghasilan.periode = mytextfield.text!
        case 1:
            let mytextfield = self.view.viewWithTag(101) as! UITextField
            mytextfield.text = pickerData[row]
            mytextfield.resignFirstResponder()
            dataPenghasilan.isBuktiPotong = mytextfield.text!
        case 2:
            let mytextfield = self.view.viewWithTag(102) as! UITextField
            mytextfield.text = pickerData[row]
            mytextfield.resignFirstResponder()
            dataPenghasilan.pekerjaan = mytextfield.text!
            
            let fieldNppn = self.view.viewWithTag(104) as! UITextField
            if mytextfield.text! == "Desain Grafis" {
                fieldNppn.text = "32"
            } else if mytextfield.text! == "Jasa Fotografi" || mytextfield.text! == "Programmer" ||  mytextfield.text! == "Digital Marketer" {
                fieldNppn.text = "50"
            } else if mytextfield.text! == "Entry Data" {
                fieldNppn.text = "55"
            }
            dataPenghasilan.nppn = Int(fieldNppn.text!)!
        default:
            return
        }
    }
    
    
}


extension PenghasilanPerTahunViewController : UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField.tag {
        case 103:
            dataPenghasilan.penghasilanTahun = Int(textField.text!)!
        case 104:
            dataPenghasilan.nppn = Int(textField.text!)!
        case 105:
            let values = textField.text
            dataPenghasilan.jumlahPphPotong.append(Int(values!)!)
            print("Contoh Potong 1 \(textField.text ?? "kosong")")
        default:
            return
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // dismiss keyboard
        return true
    }
    
   
}


