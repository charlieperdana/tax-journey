//
//  PTKPViewController.swift
//  TaxJourney
//
//  Created by Kendra Arsena Wijaya on 08/04/21.
//

import UIKit

class TitleCell: UITableViewCell {
}

class PickerCell: UITableViewCell {
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var txtPilih: UITextField!
}

class ChevronCell: UITableViewCell {
    @IBOutlet weak var imgCheck: UIImageView!
    @IBOutlet weak var lblTanggungan: UILabel!
}

class ButtonCell: UITableViewCell {
    @IBOutlet weak var btnRincian: UIButton!
    @IBOutlet weak var btnLanjut: UIButton!
}

class CaptionCell: UITableViewCell {
    @IBOutlet weak var lblCaption: UILabel!
}

class ImageCell: UITableViewCell {
    
}

var kelamin:String = ""
var isMenikah:String = ""
var isNPWPdigabung:String = ""
var isSuamiBerpenghasilan:String = ""
var suratketerangankeluarahan:String = ""

class PTKPViewController: UIViewController {

    @IBOutlet weak var tvPTKP: UITableView!
    var pickerKelamin: UIPickerView!
    var pickerNikah: UIPickerView!
    var PickerYesNoSatu:UIPickerView!
    var PickerYesNoDua:UIPickerView!
    var PickerYesNoTiga:UIPickerView!
    var options = [String]()
    var toolbar:UIToolbar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tvPTKP.delegate = self
        tvPTKP.dataSource = self
        pickerUI()
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let buttonOK = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(buttonOK)
        self.present(alert, animated: true, completion: nil)
    }
}

extension PTKPViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 19
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cellImage = tableView.dequeueReusableCell(withIdentifier: "cellImage") as! ImageCell
            
            cellImage.separatorInset = UIEdgeInsets(top: 0, left: cellImage.bounds.size.width, bottom: 0, right: 0);
            
            return cellImage
        } else if indexPath.row == 1 {
            let cellCaption = tableView.dequeueReusableCell(withIdentifier: "cellCaption") as! CaptionCell
            
            cellCaption.lblCaption.isHidden = true
            cellCaption.separatorInset = UIEdgeInsets(top: 0, left: cellCaption.bounds.size.width, bottom: 0, right: 0);
            
            return cellCaption
        } else if indexPath.row == 2 {
            let cellTitle = tableView.dequeueReusableCell(withIdentifier: "cellTitle") as! TitleCell
            
            cellTitle.textLabel?.text = "Status Perkawinan"
            cellTitle.accessoryType = .none
            
            return cellTitle
        } else if indexPath.row == 3 {
            let cellPicker = tableView.dequeueReusableCell(withIdentifier: "cellPicker") as! PickerCell
            
            cellPicker.lblStatus.text = "Jenis kelamin"
            cellPicker.txtPilih.inputView = pickerKelamin
            cellPicker.txtPilih.inputAccessoryView = toolbar
            cellPicker.txtPilih.tag = 100
            options = ["Laki-laki", "Perempuan"]
            
            return cellPicker
        } else if indexPath.row == 4 {
            let cellPicker = tableView.dequeueReusableCell(withIdentifier: "cellPicker") as! PickerCell

            cellPicker.lblStatus.text = "Sudah menikah"
            cellPicker.txtPilih.tag = 101
            cellPicker.txtPilih.inputView = pickerNikah
            cellPicker.txtPilih.inputAccessoryView = toolbar

            return cellPicker
        } else if indexPath.row == 5 {
            if isMenikah == "Menikah" && kelamin == "Perempuan" {
                tvPTKP.insertRows(at: [IndexPath(row: 5, section: 0)], with: .automatic)
                
                let cellPicker = tableView.dequeueReusableCell(withIdentifier: "cellPicker") as! PickerCell
                
                cellPicker.lblStatus.text = "NPWP digabung"
                cellPicker.txtPilih.inputView = PickerYesNoSatu
                cellPicker.txtPilih.inputAccessoryView = toolbar
                cellPicker.txtPilih.tag = 102
                
                return cellPicker
            } else {
                tvPTKP.deleteRows(at: [IndexPath(row: 5, section: 0)], with: .automatic)
            }
        } else if indexPath.row == 6 {
            if isNPWPdigabung == "Tidak" {
                let cellPicker = tableView.dequeueReusableCell(withIdentifier: "cellPicker") as! PickerCell
            
                cellPicker.lblStatus.text = "Suami berpenghasilan"
                cellPicker.txtPilih.inputView = PickerYesNoDua
                cellPicker.txtPilih.inputAccessoryView = toolbar
                cellPicker.txtPilih.tag = 103
                
                tvPTKP.insertRows(at: [IndexPath(row: 6, section: 0)], with: .automatic)
                
                return cellPicker
            } else {
                tvPTKP.deleteRows(at: [IndexPath(row: 6, section: 0)], with: .automatic)
            }
        } else if indexPath.row == 7 {
            if isSuamiBerpenghasilan == "Tidak" {
                let cellPicker = tableView.dequeueReusableCell(withIdentifier: "cellPicker") as! PickerCell
                
                cellPicker.lblStatus.text = "Surat keterangan kelurahan"
                cellPicker.txtPilih.inputView = PickerYesNoTiga
                cellPicker.txtPilih.inputAccessoryView = toolbar
                cellPicker.txtPilih.tag = 104
                
                tvPTKP.insertRows(at: [IndexPath(row: 7, section: 0)], with: .automatic)
                
                return cellPicker
            } else {
                tvPTKP.deleteRows(at: [IndexPath(row: 7, section: 0)], with: .automatic)
            }
            
        } else if indexPath.row == 8 {
            if isSuamiBerpenghasilan == "Tidak" {
                let cellCaption = tableView.dequeueReusableCell(withIdentifier: "cellCaption") as! CaptionCell
                
                cellCaption.lblCaption.text = "Surat keterangan bahwa suami tidak berpenghasilan dari kelurahan."
                cellCaption.separatorInset = UIEdgeInsets(top: 0, left: cellCaption.bounds.size.width, bottom: 0, right: 0);
                
                tvPTKP.insertRows(at: [IndexPath(row: 8, section: 0)], with: .automatic)
                
                return cellCaption
            } else {
                tvPTKP.deleteRows(at: [IndexPath(row: 8, section: 0)], with: .automatic)
            }
        } else if indexPath.row == 9 {
            let cellCaption = tableView.dequeueReusableCell(withIdentifier: "cellCaption") as! CaptionCell
            
            cellCaption.separatorInset = UIEdgeInsets(top: 0, left: cellCaption.bounds.size.width, bottom: 0, right: 0);
            
            return cellCaption
        } else if indexPath.row == 10 {
            let cellTitle = tableView.dequeueReusableCell(withIdentifier: "cellTitle") as! TitleCell
            
            cellTitle.textLabel?.text = "Jumlah Tanggungan"
            
            return cellTitle
        } else if indexPath.row == 11 {
            let cellChevron = tableView.dequeueReusableCell(withIdentifier: "cellChevron") as! ChevronCell
            
            cellChevron.lblTanggungan.text = "Ayah"
            cellChevron.imgCheck.isHidden = true
            
            return cellChevron
        } else if indexPath.row == 12 {
            let cellChevron = tableView.dequeueReusableCell(withIdentifier: "cellChevron") as! ChevronCell
            
            cellChevron.lblTanggungan.text = "Ibu"
            
            return cellChevron
        } else if indexPath.row == 13 {
            let cellChevron = tableView.dequeueReusableCell(withIdentifier: "cellChevron") as! ChevronCell
            
            cellChevron.lblTanggungan.text = "Ayah mertua"
            
            return cellChevron
        } else if indexPath.row == 14 {
            let cellChevron = tableView.dequeueReusableCell(withIdentifier: "cellChevron") as! ChevronCell
            
            cellChevron.lblTanggungan.text = "Ibu Mertua"
            
            return cellChevron
        } else if indexPath.row == 15 {
            let cellChevron = tableView.dequeueReusableCell(withIdentifier: "cellChevron") as! ChevronCell
            
            cellChevron.lblTanggungan.text = "Anak"
            
            return cellChevron
        } else if indexPath.row == 16 {
            let cellCaption = tableView.dequeueReusableCell(withIdentifier: "cellCaption") as! CaptionCell
            
            cellCaption.lblCaption.text = "Jumlah tanggungan: 3"
            cellCaption.lblCaption.textColor = .black
            cellCaption.lblCaption.font = UIFont.systemFont(ofSize: 17)
            cellCaption.separatorInset = UIEdgeInsets(top: 0, left: cellCaption.bounds.size.width, bottom: 0, right: 0);
            
            return cellCaption
        } else if indexPath.row == 17 {
            let cellCaption = tableView.dequeueReusableCell(withIdentifier: "cellCaption") as! CaptionCell
            
            cellCaption.lblCaption.isHidden = true
            cellCaption.separatorInset = UIEdgeInsets(top: 0, left: cellCaption.bounds.size.width, bottom: 0, right: 0);
            
            return cellCaption
        } else if indexPath.row == 18 {
            let cellButton = tableView.dequeueReusableCell(withIdentifier: "cellButton") as! ButtonCell
            
            cellButton.btnRincian.layer.borderWidth = 2
            cellButton.btnRincian.layer.cornerRadius = 10
            cellButton.btnRincian.layer.borderColor = #colorLiteral(red: 0.1594613791, green: 0.150028497, blue: 0.2833949625, alpha: 1)
            cellButton.btnLanjut.layer.cornerRadius = 10
            cellButton.separatorInset = UIEdgeInsets(top: 0, left: cellButton.bounds.size.width, bottom: 0, right: 0);
            
            cellButton.btnLanjut.addTarget(self, action: #selector(lanjut), for: .touchUpInside)
            cellButton.btnRincian.addTarget(self, action: #selector(lihatrincian), for: .touchUpInside)
            
            return cellButton
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showAlert(title: "tes", message: "\(indexPath.row)")
        switch indexPath.row {
        case 11:
            showAlert(title: "Ayah", message: "ini ayah")
        case 12:
            showAlert(title: "Ibu", message: "ini ibu")
        case 13:
            showAlert(title: "Ayah mertua", message: "ini ayah mertua")
        case 14:
            showAlert(title: "Ibu mertua", message: "ini ibu mertua")
        case 15:
            showAlert(title: "Anak", message: "ini anak")
        default:
            return
        }
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        if indexPath.row == 10 {
            //showAlert(title: "Halo", message: "Lagi pencet info button")
            let slideVC = JumlahTanggunganViewController()
            slideVC.modalPresentationStyle = .custom
            slideVC.transitioningDelegate = self
            self.present(slideVC, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 102
        } else if indexPath.row == 1 || indexPath.row == 9 {
            return 24
        } else if indexPath.row == 17 {
            return 144
        } else {
            return 44
        }
    }
    
    
    
    @objc func lanjut() {
        performSegue(withIdentifier: "toKesimpulan", sender: self)
    }
    
    @objc func lihatrincian() {
    }
}

extension PTKPViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 0:
//            let mytextfield = self.view.viewWithTag(100) as! UITextField
//            mytextfield.text = options[0]
            options = ["Laki-laki", "Perempuan"]
        case 1:
            options = ["Menikah", "Belum menikah"]
        case 2:
            options = ["Ya", "Tidak"]
        case 3:
            options = ["Ya", "Tidak"]
        case 4:
            options = ["Ya", "Tidak"]
        default:
            options = ["", ""]
        }
        return options[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 0:
            let mytextfield = self.view.viewWithTag(100) as! UITextField
            mytextfield.text = options[row]
            kelamin = mytextfield.text!
        case 1:
            let mytextfield = self.view.viewWithTag(101) as! UITextField
            mytextfield.text = options[row]
            isMenikah = mytextfield.text!
        case 2:
            let mytextfield = self.view.viewWithTag(102) as! UITextField
            mytextfield.text = options[row]
            isNPWPdigabung = mytextfield.text!
        case 3:
            let mytextfield = self.view.viewWithTag(103) as! UITextField
            mytextfield.text = options[row]
            isSuamiBerpenghasilan = mytextfield.text!
        case 4:
            let mytextfield = self.view.viewWithTag(104) as! UITextField
            mytextfield.text = options[row]
            suratketerangankeluarahan = mytextfield.text!
        default:
            return
        }
    }
    
    func pickerUI() {
        pickerKelamin = createPicker()
        pickerKelamin.tag = 0

        pickerNikah = createPicker()
        pickerNikah.tag = 1
        
        PickerYesNoSatu = createPicker()
        PickerYesNoSatu.tag = 2
        
        PickerYesNoDua = createPicker()
        PickerYesNoDua.tag = 3
        
        PickerYesNoTiga = createPicker()
        PickerYesNoTiga.tag = 4
        
        toolbar = UIToolbar()
        toolbar!.sizeToFit()

        let buttonDone = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(done))

        toolbar!.setItems([buttonDone], animated: true)
        toolbar!.isUserInteractionEnabled = true
    }
    
    @objc func done() {
        self.view.endEditing(true)
        tvPTKP.reloadData()
    }
    
    func createPicker() -> UIPickerView {
        let picker = UIPickerView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        picker.dataSource = self
        picker.delegate = self
        picker.backgroundColor = .white
        return picker
    }
}

extension PTKPViewController: UIViewControllerTransitioningDelegate{
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        PresentationController(presentedViewController: presented, presenting: presenting)
    }
}
