//
//  SurucuEkle.swift
//  ebsnakliyat2
//
//  Created by Berk on 1.11.2022.
//

import UIKit

class SurucuEkle: UIViewController {

    @IBOutlet weak var TextIlcePicker: UITextField!
    
    @IBOutlet weak var ButtonSurucuEkle: UIButton!
    
    @IBOutlet weak var TextSurucuAdi: UITextField!
    
    @IBOutlet weak var TextSurucuTelefonu: UITextField!
    
    @IBOutlet weak var TextAracKapasitesi: UITextField!
    
    @IBOutlet weak var TextSurucuSoyadi: UITextField!
    
    @IBOutlet weak var TextUcret: UITextField!
    
    let ilceler = ["Adalar", "Arnavutköy", "Ataşehir", "Avcılar", "Bağcılar", "Bahçelievler", "Bakırköy", "Başakşehir", "Bayrampaşa", "Beşiktaş", "Beykoz", "Beylikdüzü", "Beyoğlu", "Büyükçekmece", "Çatalca", "Çekmeköy", "Esenler", "Esenyurt", "Eyüpsultan", "Fatih", "Gaziosmanpaşa", "Güngören", "Kadıköy", "Kağıthane", "Kartal", "Küçükçekmece", "Maltepe", "Pendik", "Sancaktepe", "Sarıyer", "Silivri", "Sultanbeyli", "Sultangazi", "Şile", "Şişli", "Tuzla", "Ümraniye", "Üsküdar", "Zeytinburnu"]
    
    let numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20"]
    
    var IlcePickerView = UIPickerView()
    
    var AracPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        IlcePickerView.delegate = self
        IlcePickerView.dataSource = self
        
        AracPickerView.delegate = self
        AracPickerView.dataSource = self
        
        TextIlcePicker.inputView = IlcePickerView
        TextAracKapasitesi.inputView = AracPickerView
        
        IlcePickerView.tag = 1
        AracPickerView.tag = 2
        
        ButtonSurucuEkle.layer.cornerRadius = 5.0
    }
    
    @IBAction func BtnSurucuEkleClick(_ sender: Any) {
        
        let decimalCharacters = CharacterSet.decimalDigits

        let decimalRange = TextSurucuAdi.text?.rangeOfCharacter(from: decimalCharacters)
        let decimalRange1 = TextSurucuSoyadi.text?.rangeOfCharacter(from: decimalCharacters)
        let isnumber = TextSurucuTelefonu.text?.isDigits
        let isnumber1 = TextUcret.text?.isDigits
        let isnumber2 = TextAracKapasitesi.text?.isDigits
        
        if decimalRange != nil || decimalRange1 != nil || isnumber != true || isnumber1 != true || isnumber2 != true
        {
            let alert = UIAlertController(title: "Sürücü Adına/Soyadına Rakam Girilemez, Sürücü Telefonuna Ve Ücrete Harf Girilemez, Alanlar Boş Bırakılamaz", message: .none, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
            DBUtil.sharedInstance.saveSurucu(isim: TextSurucuAdi.text!, soyisim: TextSurucuSoyadi.text!, telefon: TextSurucuTelefonu.text!, ilce: TextIlcePicker.text!, teklif_siparis_id: 0)
            DBUtil.sharedInstance.saveArac(kapasite: TextAracKapasitesi.text!, ucret: TextUcret.text!)
        }
        
    }
    
}

extension String {
  var isDigits: Bool {
    guard !self.isEmpty else { return false }
    return !self.contains { Int(String($0)) == nil }
  }
}

extension SurucuEkle: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return ilceler.count
        case 2:
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
            return numbers[row]
        default:
            return "Data yok"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            TextIlcePicker.text = ilceler[row]
            TextIlcePicker.resignFirstResponder()
        case 2:
            TextAracKapasitesi.text = numbers[row]
            TextAracKapasitesi.resignFirstResponder()
        default:
            return
        }
    }
}
