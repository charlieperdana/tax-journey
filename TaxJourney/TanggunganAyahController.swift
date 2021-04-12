//
//  TanggunganAyahController.swift
//  TaxJourney
//
//  Created by Akbar Priyonggo on 06/04/21.
//

import UIKit

class TanggunganAyahController: UIViewController {

    @IBOutlet weak var namaPage: UILabel!
    @IBOutlet weak var tanggunganAyahTableView: UITableView!
    @IBOutlet weak var ayahIsSerumahTextField: UITextField!
    @IBOutlet weak var ayahIsBerpenghasilanTextField: UITextField!
    
    var ayah = tanggunganOrtu(hubungan: "Ayah")
    let pilihanAyahSerumahPickerView = UIPickerView()
    let pilihanAyahBerpenghasilanPickerView = UIPickerView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        namaPage.text = ayah.hubungan
        tanggunganAyahTableView.delegate = self
        tanggunganAyahTableView.dataSource = self
       
        pilihanAyahSerumahPickerView.delegate = self
        pilihanAyahSerumahPickerView.dataSource = self
        pilihanAyahSerumahPickerView.tag = 0
        
        pilihanAyahBerpenghasilanPickerView.delegate = self
        pilihanAyahBerpenghasilanPickerView.dataSource = self
        pilihanAyahBerpenghasilanPickerView.tag = 1
        
        ayahIsSerumahTextField.inputView = pilihanAyahSerumahPickerView
        ayahIsSerumahTextField.placeholder = "Pilih"
        ayahIsSerumahTextField.textAlignment = .right
        
        ayahIsBerpenghasilanTextField.inputView = pilihanAyahBerpenghasilanPickerView
        ayahIsBerpenghasilanTextField.placeholder = "Pilih"
        ayahIsBerpenghasilanTextField.textAlignment = .right
    }

}

//tableview
extension TanggunganAyahController: UITableViewDelegate, UITableViewDataSource {
    
    // jumlah baris
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    //tampilan cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Tinggal dengan \(ayah.hubungan)"
        case 1:
            cell.textLabel?.text = "\(ayah.hubungan) masih berpenghasilan"
        default:
            return cell
        }
        
        return cell
    }
    
}

//picker
extension TanggunganAyahController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pilihan.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pilihan[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch pickerView.tag {
        case 0:
            ayahIsSerumahTextField.text = pilihan[row]
            ayahIsSerumahTextField.resignFirstResponder()
        case 1:
            ayahIsBerpenghasilanTextField.text = pilihan[row]
            ayahIsBerpenghasilanTextField.resignFirstResponder()
        default:
            return
        }
        
        
    }
}



struct tanggunganOrtu {
    var hubungan:String
    var isSerumah:Bool = false
    var isBerpenghasilan:Bool = false
    
    init(hubungan:String) {
        self.hubungan = hubungan
        
    }
}

let pilihan = ["Ya", "Tidak"]

