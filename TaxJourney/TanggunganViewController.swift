//
//  TanggunganViewController.swift
//  TaxJourney
//
//  Created by Kendra Arsena Wijaya on 12/04/21.
//

import UIKit

var jumlahanak:Int = 0
var jumlahtanggungan:Int = 0

class Tanggungan:UITableViewCell {
    @IBOutlet weak var label:UILabel!
    @IBOutlet weak var picker:UITextField!
}

class TanggunganViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var id:Int?
    var titleNavBar:String?
    
    var cekPilihan1:String = ""
    var cekPilihan2:String = ""
    var check:Bool?
    
    @IBOutlet weak var tvTanggungan: UITableView!
    @IBOutlet weak var stepperAnak: UIStepper!
    
    var picker1:UIPickerView!
    var picker2:UIPickerView!
    var toolbar:UIToolbar!
    let options = ["Ya", "Tidak"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stepperAnak.value = 0
//        print(id!)
        tvTanggungan.delegate = self
        tvTanggungan.dataSource = self
        navigationItem.title = titleNavBar
        
        let buttonBack = UIButton(type: .system)
        buttonBack.setTitle("Back", for: .normal)
        buttonBack.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        buttonBack.addTarget(self, action: #selector(buttonBackTapped), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: buttonBack)
        
        pickerUI()
    }
    
    @objc func buttonBackTapped() {
        navigationController?.popViewController(animated: true)
//        print(id!)
        if titleNavBar == "Anak"{
            if cekPilihan1 == "Tidak" || (cekPilihan1 == "Ya" && jumlahanak > 0) {
                jumlahtanggungan += jumlahanak
                check = true
            } else { check = false }
        } else {
            if cekPilihan1 == "Tidak" || (cekPilihan1 == "Ya" && !cekPilihan2.isEmpty) {
                if cekPilihan2 == "Ya" { jumlahtanggungan += 1 }
                check = true
            } else { check = false }
        }
//        check = true
        performSegue(withIdentifier: "goToPTKP", sender: self)
    }
    
    @IBAction func stepper(_ sender: UIStepper) {
        jumlahanak = Int(sender.value)
        tvTanggungan.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if titleNavBar == "Anak" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellTanggungan") as! Tanggungan
            switch indexPath.row {
            case 0:
                cell.label.text = "Sudah Punya Anak"
                cell.picker.inputView = picker1
                cell.picker.inputAccessoryView = toolbar
                cell.picker.tag = 10
            case 1:
                if cekPilihan1 == "Ya" {
                    cell.label.text = "Jumlah anak: \(jumlahanak)"
                    cell.picker.isHidden = true
                } else {
                    cell.isHidden = true
                }
            case 2:
                if cekPilihan1 == "Ya" {
                    stepperAnak.isHidden = false
                    cell.label.text = "Jumlah anak yang belum menikah dan belum berpenghasilan"
                    cell.label.font = UIFont.systemFont(ofSize: 12)
                    cell.label.textColor = #colorLiteral(red: 0.5999459028, green: 0.6000347733, blue: 0.5999264121, alpha: 1)
                    cell.picker.isHidden = true
                    cell.separatorInset = UIEdgeInsets(top: 0, left: cell.bounds.size.width, bottom: 0, right: 0)
                } else {
                    stepperAnak.isHidden = true
                    cell.isHidden = true
                }
            case 3:
                cell.isHidden = true
                cell.separatorInset = UIEdgeInsets(top: 0, left: cell.bounds.size.width, bottom: 0, right: 0)
            case 4:
                cell.isHidden = true
                cell.separatorInset = UIEdgeInsets(top: 0, left: cell.bounds.size.width, bottom: 0, right: 0)
            default:
                cell.picker.isHidden = true
                cell.label.isHidden = true
            }
            return cell
        }
        
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellTanggungan") as! Tanggungan
            switch indexPath.row {
            case 0:
                cell.label.text = "Tinggal dengan \(titleNavBar!)"
                cell.picker.inputView = picker1
                cell.picker.inputAccessoryView = toolbar
                cell.picker.tag = 10
            case 1:
                cell.label.text = "Pilih 'Ya' jika kamu masih tinggal serumah dengan \(titleNavBar!)mu."
                cell.label.font = UIFont.systemFont(ofSize: 12)
                cell.label.textColor = #colorLiteral(red: 0.5999459028, green: 0.6000347733, blue: 0.5999264121, alpha: 1)
                cell.picker.isHidden = true
                cell.separatorInset = UIEdgeInsets(top: 0, left: cell.bounds.size.width, bottom: 0, right: 0)
            case 2:
                cell.isHidden = true
                cell.separatorInset = UIEdgeInsets(top: 0, left: cell.bounds.size.width, bottom: 0, right: 0)
            case 3:
                if cekPilihan1 == "Ya" {
                    cell.label.text = "Tinggal dengan \(titleNavBar!)"
                    cell.picker.inputView = picker2
                    cell.picker.inputAccessoryView = toolbar
                    cell.picker.tag = 11
                } else {
                    cell.isHidden = true
                }
            case 4:
                if cekPilihan1 == "Ya" {
                    cell.label.text = "Pilih 'Ya' jika \(titleNavBar!)mu masih bekerja dan memiliki penghasilan sendiri"
                    cell.label.font = UIFont.systemFont(ofSize: 12)
                    cell.label.textColor = #colorLiteral(red: 0.5999459028, green: 0.6000347733, blue: 0.5999264121, alpha: 1)
                    cell.picker.isHidden = true
                    cell.separatorInset = UIEdgeInsets(top: 0, left: cell.bounds.size.width, bottom: 0, right: 0)
                } else {
                    cell.isHidden = true
                }
            default:
                cell.label.isHidden = true
                cell.picker.isHidden = true
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if titleNavBar != "Anak" {
            if indexPath.row == 2 {
                return 16
            }
        }
        return 44
    }
}

extension TanggunganViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            let mytextfield = self.view.viewWithTag(10) as! UITextField
            mytextfield.text = options[row]
            cekPilihan1 = mytextfield.text!
        case 2:
            let mytextfield = self.view.viewWithTag(11) as! UITextField
            mytextfield.text = options[row]
            cekPilihan2 = mytextfield.text!
        default:
            return
        }
    }
    
    func pickerUI() {
        picker1 = createPicker()
        picker1.tag = 1
        
        picker2 = createPicker()
        picker2.tag = 2
        
        toolbar = UIToolbar()
        toolbar!.sizeToFit()

        let buttonDone = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(done))

        toolbar!.setItems([buttonDone], animated: true)
        toolbar!.isUserInteractionEnabled = true
    }
    
    @objc func done() {
        self.view.endEditing(true)
        tvTanggungan.reloadData()
    }
    
    func createPicker() -> UIPickerView {
        let picker = UIPickerView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        picker.dataSource = self
        picker.delegate = self
        picker.backgroundColor = .white
        return picker
    }
}
