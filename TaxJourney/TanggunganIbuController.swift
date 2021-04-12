//
//  TanggunganIbuController.swift
//  TaxJourney
//
//  Created by Akbar Priyonggo on 10/04/21.
//

import UIKit

class TanggunganIbuController: UIViewController {

    @IBOutlet weak var namaPage: UILabel!
    @IBOutlet weak var tanggunganIbuTableView: UITableView!
    @IBOutlet weak var ibuIsSerumahTextField: UITextField!
    @IBOutlet weak var ibuIsBerpenghasilanTextField: UITextField!
    
    var ibu = tanggunganOrtu(hubungan: "Ibu")
    let pilihanIbuSerumahPickerView = UIPickerView()
    let pilihanIbuBerpenghasilanPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        namaPage.text = ibu.hubungan
        tanggunganIbuTableView.delegate = self
        tanggunganIbuTableView.dataSource = self
       
        pilihanIbuSerumahPickerView.delegate = self
        pilihanIbuSerumahPickerView.dataSource = self
        pilihanIbuSerumahPickerView.tag = 0
        
        pilihanIbuBerpenghasilanPickerView.delegate = self
        pilihanIbuBerpenghasilanPickerView.dataSource = self
        pilihanIbuBerpenghasilanPickerView.tag = 1
        
        ibuIsSerumahTextField.inputView = pilihanIbuSerumahPickerView
        ibuIsSerumahTextField.placeholder = "Pilih"
        ibuIsSerumahTextField.textAlignment = .right
        
        ibuIsBerpenghasilanTextField.inputView = pilihanIbuBerpenghasilanPickerView
        ibuIsBerpenghasilanTextField.placeholder = "Pilih"
        ibuIsBerpenghasilanTextField.textAlignment = .right
        
    }

}

//tableview
extension TanggunganIbuController: UITableViewDelegate, UITableViewDataSource {
    
    // jumlah baris
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    //tampilan cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Tinggal dengan \(ibu.hubungan)"
        case 1:
            cell.textLabel?.text = "\(ibu.hubungan) masih berpenghasilan"
        default:
            return cell
        }
        
        return cell
    }
    
}

//picker
extension TanggunganIbuController: UIPickerViewDelegate, UIPickerViewDataSource {
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
            ibuIsSerumahTextField.text = pilihan[row]
            ibuIsSerumahTextField.resignFirstResponder()
        case 1:
            ibuIsBerpenghasilanTextField.text = pilihan[row]
            ibuIsBerpenghasilanTextField.resignFirstResponder()
        default:
            return
        }
        
        
    }
}
