//
//  PerhitunganPTKPViewController.swift
//  TaxJourney
//
//  Created by Kendra Arsena Wijaya on 06/04/21.
//

import UIKit

class PerhitunganPTKPViewController: UIViewController {
    
    @IBOutlet weak var tvPerkawinan: UITableView!
    @IBOutlet weak var btnLihatRincian: UIButton!
    @IBOutlet weak var btnLnjt: UIButton!
    
    @IBOutlet weak var lblCaption: UILabel!
    
    var pickerKelamin: UIPickerView!
    var pickerNikah: UIPickerView!
    var PickerYesNoSatu:UIPickerView!
    var PickerYesNoDua:UIPickerView!
    var PickerYesNoTiga:UIPickerView!
    var options = [String]()
    
    //for data Penghasialn Per Tahun Page
    var dataPenghasilanPerTahun : PenghasilanPertahunData?
    
    var toolbar:UIToolbar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tvPerkawinan.delegate = self
        tvPerkawinan.dataSource = self
        lblCaption.isHidden = true
        buttonUI()
        pickerUI()
    }
    @objc func miniView() {
            let slideVC = JumlahTanggunganViewController()
            slideVC.modalPresentationStyle = .custom
            slideVC.transitioningDelegate = self
            self.present(slideVC, animated: true, completion: nil)
        }

    
    @IBAction func infoButton(_ sender: UIButton) {
        miniView()
    }
    func buttonUI() {
        btnLihatRincian.layer.borderWidth = 2
        btnLihatRincian.layer.borderWidth = 2
        btnLihatRincian.layer.borderColor = #colorLiteral(red: 0.1594613791, green: 0.150028497, blue: 0.2833949625, alpha: 1)
        btnLnjt.layer.borderWidth = 2
        btnLnjt.layer.borderWidth = 2
    }
    
    @IBAction func btnJumlahTanggungan(_ sender: Any) {
    }
    
    @IBAction func btnRincian(_ sender: Any) {
    }
    
    @IBAction func btnLanjut(_ sender: Any) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension PerhitunganPTKPViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellPerkawinan") as! PerkawinanTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.lblTvPerkawinan.text = "Jenis kelamin"
            cell.txtTvPerkawinan.inputView = pickerKelamin
            cell.txtTvPerkawinan.inputAccessoryView = toolbar
            options = ["Laki-laki", "Perempuan"]
            cell.txtTvPerkawinan.tag = 100
        case 1:
            cell.lblTvPerkawinan.text = "Sudah menikah"
            cell.txtTvPerkawinan.inputView = pickerNikah
            cell.txtTvPerkawinan.inputAccessoryView = toolbar
            cell.txtTvPerkawinan.tag = 101
            cell.isHidden = true
        case 2:
            cell.lblTvPerkawinan.text = "NPWP digabung"
            cell.txtTvPerkawinan.inputView = PickerYesNoSatu
            cell.txtTvPerkawinan.inputAccessoryView = toolbar
            cell.txtTvPerkawinan.tag = 102
            cell.isHidden = true
        case 3:
            cell.lblTvPerkawinan.text = "Suami berpenghasilan"
            cell.txtTvPerkawinan.inputView = PickerYesNoDua
            cell.txtTvPerkawinan.inputAccessoryView = toolbar
            cell.txtTvPerkawinan.tag = 103
            cell.isHidden = true
        case 4:
            cell.lblTvPerkawinan.text = "Surat keterangan kelurahan"
            cell.txtTvPerkawinan.inputView = PickerYesNoTiga
            cell.txtTvPerkawinan.inputAccessoryView = toolbar
            cell.txtTvPerkawinan.tag = 104
            cell.isHidden = true
            
        default:
            options = ["Ya", "Tidak"]
        }
        
        return cell
    }
}

extension PerhitunganPTKPViewController: UIPickerViewDelegate, UIPickerViewDataSource {
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
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 0:
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
        case 1:
            let mytextfield = self.view.viewWithTag(101) as! UITextField
            mytextfield.text = options[row]
        case 2:
            let mytextfield = self.view.viewWithTag(102) as! UITextField
            mytextfield.text = options[row]
        case 3:
            let mytextfield = self.view.viewWithTag(103) as! UITextField
            mytextfield.text = options[row]
        case 4:
            let mytextfield = self.view.viewWithTag(104) as! UITextField
            mytextfield.text = options[row]
        default:
            return
        }
    }
    
    func createPicker() -> UIPickerView {
        let picker = UIPickerView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        picker.dataSource = self
        picker.delegate = self
        picker.backgroundColor = .white
        return picker
    }
}

extension PerhitunganPTKPViewController: UIViewControllerTransitioningDelegate{
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        PresentationController(presentedViewController: presented, presenting: presenting)
    }
}
