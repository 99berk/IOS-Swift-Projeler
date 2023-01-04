//
//  OdemeEkraniViewController.swift
//  ebsnakliyat2
//
//  Created by Berk on 20.12.2022.
//

import UIKit

class OdemeEkraniViewController: UIViewController {
    
    @IBOutlet weak var KUIsimText: UITextField!
    @IBOutlet weak var KNumarasiText: UITextField!
    @IBOutlet weak var SKTText: UITextField!
    @IBOutlet weak var CVVText: UITextField!
    @IBOutlet weak var OdeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.CVVText.delegate = self
        self.KNumarasiText.delegate = self
        self.SKTText.delegate = self
        
        OdeButton.layer.cornerRadius = 5.0
    }
    
    
    @IBAction func OdeButtonClick(_ sender: Any) {
        
        let decimalCharacters = CharacterSet.decimalDigits
        
        let decimalRange = KUIsimText.text?.rangeOfCharacter(from: decimalCharacters)
        
        let isnumber = KNumarasiText.text?.isDigits
        let isnumber1 = CVVText.text?.isDigits
        
        
        
        if (SKTText.text == "" || KUIsimText.text == "" || decimalRange != nil || isnumber != true || isnumber1 != true || KNumarasiText.text!.count < 16 || CVVText.text!.count < 3)
        {
            let alert = UIAlertController(title: "Boş Alan Bırakılamaz, İsime Rakam Girilemez, Kart Numarasına Harf Girilemez, Kart Numarası 16 Haneden Az Olamaz, CVV 3 Haneden Az Olamaz", message: .none, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
            DBUtil.sharedInstance.saveKullanıcı(isim: KUIsimText.text!, kartNo: KNumarasiText.text!, skt: SKTText.text!, cvv: CVVText.text!)
        }
    }

}

extension OdemeEkraniViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let newString = NSString(string: textField.text!).replacingCharacters(in: range, with: string)
        
        if (textField == CVVText) {
            let component = newString.components(separatedBy: NSCharacterSet.decimalDigits.inverted)
            let decimalString = component.joined(separator: "") as NSString
            let length = decimalString.length
            
            if (length > 0) {
                let newLength = (textField.text! as NSString).length + (string as NSString).length - range.length as Int
                return newLength > 3 ? false : true
            }
        }
        
        if (textField == KNumarasiText) {
            let component = newString.components(separatedBy: NSCharacterSet.decimalDigits.inverted)
            let decimalString = component.joined(separator: "") as NSString
            let length = decimalString.length
            
            if (length > 0) {
                let newLength = (textField.text! as NSString).length + (string as NSString).length - range.length as Int
                return newLength > 16 ? false : true
            }
        }
        
        if (textField == SKTText) {
            if string == "" {
                return true
            }
            let currentText = textField.text! as NSString
            let updatedText = currentText.replacingCharacters(in: range, with: string)
            textField.text = updatedText
            let numberOfCharacters = updatedText.count
            if numberOfCharacters == 2 {
                textField.text?.append("/")
            }
            return false
        }
        
        return true
    }
}
