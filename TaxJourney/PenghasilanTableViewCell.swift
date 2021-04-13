//
//  PenghasilanTableViewCell.swift
//  TaxJourney
//
//  Created by charlie siagian on 07/04/21.
//

import UIKit

class PenghasilanTableViewCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var itemLabel: UILabel!
    
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var fieldPilih: UITextField!
    
    let yearPicker = UIPickerView()
    
    var yearsTillNow : [String] {
        var years = [String]()
        for i in (1970..<2022).reversed() {
            years.append("\(i)")
        }
        return years
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        fieldPilih.delegate = self
////
//        yearPicker.delegate = self
//        yearPicker.dataSource = self
//
//        fieldPilih.inputView = yearPicker
        fieldPilih.textAlignment = .right
//        fieldPilih.placeholder = "Pilih"
//        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        <#code#>
//    }
    

}

//extension PenghasilanTableViewCell : UIPickerViewDelegate, UIPickerViewDataSource{
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return yearsTillNow.count
//    }
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return yearsTillNow[row]
//    }
//
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        fieldPilih.text = yearsTillNow[row]
//        fieldPilih.resignFirstResponder()
//    }
//
//
//}
