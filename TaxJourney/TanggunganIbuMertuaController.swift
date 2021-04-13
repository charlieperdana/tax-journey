//
//  TanggunganIbuMertuaController.swift
//  TaxJourney
//
//  Created by Akbar Priyonggo on 10/04/21.
//

import UIKit

class TanggunganIbuMertuaController: UIViewController {

    @IBOutlet weak var namaPage: UILabel!
    @IBOutlet weak var tanggunganIbuMertuaTableView: UITableView!
    @IBOutlet weak var ibuMertuaIsSerumahTextField: UITextField!
    @IBOutlet weak var ibuMertuaIsBerpenghasilanTextField: UITextField!
    
    var ibuMertua = tanggunganOrtu(hubungan: "Ibu Mertua")
    let pilihanIbuMertuaSerumahPickerView = UIPickerView()
    let pilihanIbuMertuaBerpenghasilanPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        namaPage.text = ibuMertua.hubungan
        tanggunganIbuMertuaTableView.delegate = self
        tanggunganIbuMertuaTableView.dataSource = self
       
        pilihanIbuMertuaSerumahPickerView.delegate = self
        pilihanIbuMertuaSerumahPickerView.dataSource = self
        pilihanIbuMertuaSerumahPickerView.tag = 0
        
        pilihanIbuMertuaBerpenghasilanPickerView.delegate = self
        pilihanIbuMertuaBerpenghasilanPickerView.dataSource = self
        pilihanIbuMertuaBerpenghasilanPickerView.tag = 1
        
        ibuMertuaIsSerumahTextField.inputView = pilihanIbuMertuaSerumahPickerView
        ibuMertuaIsSerumahTextField.placeholder = "Pilih"
        ibuMertuaIsSerumahTextField.textAlignment = .right
        
        ibuMertuaIsBerpenghasilanTextField.inputView = pilihanIbuMertuaBerpenghasilanPickerView
        ibuMertuaIsBerpenghasilanTextField.placeholder = "Pilih"
        ibuMertuaIsBerpenghasilanTextField.textAlignment = .right
    }
    
}

//tableview
extension TanggunganIbuMertuaController: UITableViewDelegate, UITableViewDataSource {
    
    // jumlah baris
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    //tampilan cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Tinggal dengan \(ibuMertua.hubungan)"
        case 1:
            cell.textLabel?.text = "\(ibuMertua.hubungan) masih berpenghasilan"
        default:
            return cell
        }
        
        return cell
    }
    
}

//picker
extension TanggunganIbuMertuaController: UIPickerViewDelegate, UIPickerViewDataSource {
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
            ibuMertuaIsSerumahTextField.text = pilihan[row]
            ibuMertuaIsSerumahTextField.resignFirstResponder()
        case 1:
            ibuMertuaIsBerpenghasilanTextField.text = pilihan[row]
            ibuMertuaIsBerpenghasilanTextField.resignFirstResponder()
        default:
            return
        }
        
        
    }
}
