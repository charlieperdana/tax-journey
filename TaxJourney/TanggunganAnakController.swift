//
//  TanggunganAnakController.swift
//  TaxJourney
//
//  Created by Akbar Priyonggo on 10/04/21.
//

import UIKit

class TanggunganAnakController: UIViewController {

    @IBOutlet weak var namaPage: UILabel!
    @IBOutlet weak var tanggunganAnakTableView: UITableView!
    @IBOutlet weak var haveAnakTextField: UITextField!
    
    
    var anak = tanggunganAnak()
    let pilihanPunyaAnakPickerView = UIPickerView()
    
    @IBAction func jumlahAnakChanged(_ sender: UIStepper) {
        anak.jumlahAnak = Int(sender.value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        namaPage.text = anak.hubungan
        tanggunganAnakTableView.delegate = self
        tanggunganAnakTableView.dataSource = self
       
        pilihanPunyaAnakPickerView.delegate = self
        pilihanPunyaAnakPickerView.dataSource = self
        
        haveAnakTextField.inputView = pilihanPunyaAnakPickerView
        haveAnakTextField.placeholder = "Pilih"
        haveAnakTextField.textAlignment = .right
        
    }
    

   

}

//tableview
extension TanggunganAnakController: UITableViewDelegate, UITableViewDataSource {
    
    // jumlah baris
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    //tampilan cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Sudah punya \(anak.hubungan)"
        case 1:
            cell.textLabel?.text = "Punya \(anak.jumlahAnak) \(anak.hubungan)"
        default:
            return cell
        }
        
        return cell
    }
    
}

//picker
extension TanggunganAnakController: UIPickerViewDelegate, UIPickerViewDataSource {
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
        
        haveAnakTextField.text = pilihan[row]
        haveAnakTextField.resignFirstResponder()
                
    }
}

struct tanggunganAnak {
    let hubungan = "Anak"
    var haveAnak = false
    var jumlahAnak:Int = 0
    
}
