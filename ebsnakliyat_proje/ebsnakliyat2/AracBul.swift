//
//  AracBul.swift
//  ebsnakliyat2
//
//  Created by Berk on 2.11.2022.
//

import UIKit

class AracBul: UIViewController {

    @IBOutlet weak var TextKalkisIlcesiPicker: UITextField!
    
    @IBOutlet weak var TextVarisIlcesiPicker: UITextField!
    
    @IBOutlet weak var TextEsyaSayisiPicker: UITextField!
    
    @IBOutlet weak var TextTarihPicker: UITextField!
    
    @IBOutlet weak var ButtonAracBul: UIButton!
    
    let datePicker = UIDatePicker()
    
    var KalkısIlcesiPickerView = UIPickerView()
    
    var VarisIlcesiPickerView = UIPickerView()
    
    var EsyaSayisiPickerView = UIPickerView()
    
    let ilceler = ["Adalar", "Arnavutköy", "Ataşehir", "Avcılar", "Bağcılar", "Bahçelievler", "Bakırköy", "Başakşehir", "Bayrampaşa", "Beşiktaş", "Beykoz", "Beylikdüzü", "Beyoğlu", "Büyükçekmece", "Çatalca", "Çekmeköy", "Esenler", "Esenyurt", "Eyüpsultan", "Fatih", "Gaziosmanpaşa", "Güngören", "Kadıköy", "Kağıthane", "Kartal", "Küçükçekmece", "Maltepe", "Pendik", "Sancaktepe", "Sarıyer", "Silivri", "Sultanbeyli", "Sultangazi", "Şile", "Şişli", "Tuzla", "Ümraniye", "Üsküdar", "Zeytinburnu"]
    
    let numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatepicker()
        
        KalkısIlcesiPickerView.delegate = self
        KalkısIlcesiPickerView.dataSource = self
        VarisIlcesiPickerView.delegate = self
        VarisIlcesiPickerView.dataSource = self
        EsyaSayisiPickerView.delegate = self
        EsyaSayisiPickerView.dataSource = self
        
        TextKalkisIlcesiPicker.inputView = KalkısIlcesiPickerView
        TextVarisIlcesiPicker.inputView = VarisIlcesiPickerView
        TextEsyaSayisiPicker.inputView = EsyaSayisiPickerView
        
        KalkısIlcesiPickerView.tag = 1
        VarisIlcesiPickerView.tag = 2
        EsyaSayisiPickerView.tag = 3
    }
    
    @IBAction func ButtonAracBulClick(_ sender: Any) {
        
        let decimalCharacters = CharacterSet.decimalDigits

        let decimalRange = TextKalkisIlcesiPicker.text?.rangeOfCharacter(from: decimalCharacters)
        let decimalRange1 = TextVarisIlcesiPicker.text?.rangeOfCharacter(from: decimalCharacters)
        let isnumber = TextEsyaSayisiPicker.text?.isDigits
        
        if (TextKalkisIlcesiPicker.text == "" || TextVarisIlcesiPicker.text == "" || TextEsyaSayisiPicker.text == "" || TextTarihPicker.text == "" || decimalRange != nil || decimalRange1 != nil || isnumber != true)
        {
            let alert = UIAlertController(title: "Boş Alan Bırakılamaz!", message: .none, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
            DBUtil.sharedInstance.saveSiparis(kalkıs: TextKalkisIlcesiPicker.text!, varis: TextVarisIlcesiPicker.text!, esya: TextEsyaSayisiPicker.text!, tarih: TextTarihPicker.text!, onay: false, teklif: false)
        }
    }
    
    func createToolBar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        
        return toolbar
    }
    
    func createDatepicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        TextTarihPicker.inputView = datePicker
        TextTarihPicker.inputAccessoryView = createToolBar()
    }
    
    @objc func donePressed() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        self.TextTarihPicker.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    
}

extension AracBul: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return ilceler.count
        case 2:
            return ilceler.count
        case 3:
            return numbers.count
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return ilceler[row]
        case 2:
            return ilceler[row]
        case 3:
            return numbers[row]
        default:
            return "Data yok"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            TextKalkisIlcesiPicker.text = ilceler[row]
            TextKalkisIlcesiPicker.resignFirstResponder()
        case 2:
            TextVarisIlcesiPicker.text = ilceler[row]
            TextVarisIlcesiPicker.resignFirstResponder()
        case 3:
            TextEsyaSayisiPicker.text = numbers[row]
            TextEsyaSayisiPicker.resignFirstResponder()
        default:
            return
        }
    }
}
