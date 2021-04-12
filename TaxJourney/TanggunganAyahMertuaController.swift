//
//  TanggunganAyahMertuaController.swift
//  TaxJourney
//
//  Created by Akbar Priyonggo on 10/04/21.
//

import UIKit

class TanggunganAyahMertuaController: UIViewController {

    @IBOutlet weak var namaPage: UILabel!
    @IBOutlet weak var tanggunganAyahMertuaTableView: UITableView!
    @IBOutlet weak var ayahMertuaIsSerumahTextField: UITextField!
    @IBOutlet weak var ayahMertuaIsBerpenghasilanTextField: UITextField!
    
    var ayahMertua = tanggunganOrtu(hubungan: "Ayah Mertua")
    let pilihanAyahMertuaSerumahPickerView = UIPickerView()
    let pilihanAyahMertuaBerpenghasilanPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        namaPage.text = ayahMertua.hubungan
        tanggunganAyahMertuaTableView.delegate = self
        tanggunganAyahMertuaTableView.dataSource = self
       
        pilihanAyahMertuaSerumahPickerView.delegate = self
        pilihanAyahMertuaSerumahPickerView.dataSource = self
        pilihanAyahMertuaSerumahPickerView.tag = 0
        
        pilihanAyahMertuaBerpenghasilanPickerView.delegate = self
        pilihanAyahMertuaBerpenghasilanPickerView.dataSource = self
        pilihanAyahMertuaBerpenghasilanPickerView.tag = 1
        
        ayahMertuaIsSerumahTextField.inputView = pilihanAyahMertuaSerumahPickerView
        ayahMertuaIsSerumahTextField.placeholder = "Pilih"
        ayahMertuaIsSerumahTextField.textAlignment = .right
        
        ayahMertuaIsBerpenghasilanTextField.inputView = pilihanAyahMertuaBerpenghasilanPickerView
        ayahMertuaIsBerpenghasilanTextField.placeholder = "Pilih"
        ayahMertuaIsBerpenghasilanTextField.textAlignment = .right
        // Do any additional setup after loading the view.
    }

}

//tableview
extension TanggunganAyahMertuaController: UITableViewDelegate, UITableViewDataSource {
    
    // jumlah baris
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    //tampilan cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Tinggal dengan \(ayahMertua.hubungan)"
        case 1:
            cell.textLabel?.text = "\(ayahMertua.hubungan) masih berpenghasilan"
        default:
            return cell
        }
        
        return cell
    }
    
}

//picker
extension TanggunganAyahMertuaController: UIPickerViewDelegate, UIPickerViewDataSource {
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
            ayahMertuaIsSerumahTextField.text = pilihan[row]
            ayahMertuaIsSerumahTextField.resignFirstResponder()
        case 1:
            ayahMertuaIsBerpenghasilanTextField.text = pilihan[row]
            ayahMertuaIsBerpenghasilanTextField.resignFirstResponder()
        default:
            return
        }
        
        
    }
}
