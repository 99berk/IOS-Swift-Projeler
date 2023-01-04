//
//  KullaniciYukIlanlariViewController.swift
//  ebsnakliyat2
//
//  Created by Berk on 16.11.2022.
//

import UIKit

class KullaniciYukIlanlariViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var kal_ilc: [String] = []
    var var_ilc: [String] = []
    var esya_say: [String] = []
    var fiyat: [String] = []
    
    var k: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            
            var sip: Int
            
            var sip_tek: Bool
            
            var sip_ony: Bool
            
            if (DBUtil.sharedInstance.db_count_SURUCU_DB_1() >= 1) {
            for i in 1...DBUtil.sharedInstance.db_count_SURUCU_DB_1() {
                
                sip = try DBUtil.sharedInstance.getbyId_SU_3(id: i)!.get(DBUtil.sharedInstance.TEKLIF_SIPARIS_ID)
                
                if (sip != 0) {
                    
                    sip_tek = try DBUtil.sharedInstance.getById_SI(id: try DBUtil.sharedInstance.getbyId_SU_3(id: i)!.get(DBUtil.sharedInstance.TEKLIF_SIPARIS_ID))!.get(DBUtil.sharedInstance.SIPARIS_TEKLIF)
                    
                    sip_ony = try DBUtil.sharedInstance.getById_SI(id: try DBUtil.sharedInstance.getbyId_SU_3(id: i)!.get(DBUtil.sharedInstance.TEKLIF_SIPARIS_ID))!.get(DBUtil.sharedInstance.SIPARIS_ONAY)
                    
                    if (sip_tek == true && sip_ony == false) {
                    
                        kal_ilc.append(try DBUtil.sharedInstance.getbyId_SU_3(id: i)!.get(DBUtil.sharedInstance.ILCE))
                    
                        var_ilc.append(try DBUtil.sharedInstance.getById_SI(id: try DBUtil.sharedInstance.getbyId_SU_3(id: i)!.get(DBUtil.sharedInstance.TEKLIF_SIPARIS_ID))!.get(DBUtil.sharedInstance.VARIS_ILCE))
                    
                        esya_say.append(try DBUtil.sharedInstance.getById_SI(id: try DBUtil.sharedInstance.getbyId_SU_3(id: i)!.get(DBUtil.sharedInstance.TEKLIF_SIPARIS_ID))!.get(DBUtil.sharedInstance.ESYA_SAYISI))
                    
                        fiyat.append(try DBUtil.sharedInstance.getbyId_AR_2(id: i)!.get(DBUtil.sharedInstance.UCRET))
                    
                        k.append(i)
                    }
                }
            }
            }
        }
        catch {
            print(" wef")
        }
        
        
        tableView.dataSource = self
        
        tableView.showsVerticalScrollIndicator = false
    }

}

extension KullaniciYukIlanlariViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kal_ilc.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as! KullaniciYukIlanlariViewCell
    
        let a = kal_ilc[indexPath.row]
        cell.Kalkis_Ilce_Lable.text = a
        
        let b = var_ilc[indexPath.row]
        cell.Varis_Ilce_Lable.text = b
        
        let c = esya_say[indexPath.row]
        cell.Esya_Sayisi_Lable.text = "Eşya Sayısı: " + c
        
        let d = fiyat[indexPath.row]
        cell.Fiyat_Lable.text = "Fiyat: " + d
        
        cell.Button_KabulEt.tag = indexPath.row
        cell.Button_KabulEt.addTarget(self, action: #selector(ButtonONClick(sender:)), for: .touchUpInside)
        
        return cell
    }
    
    @objc func ButtonONClick (sender:UIButton) {
        do{
            if (sender.tag == 0) {
                DBUtil.sharedInstance.Siparis_onay_update(id: try DBUtil.sharedInstance.getbyId_SU_3(id: k[0])!.get(DBUtil.sharedInstance.TEKLIF_SIPARIS_ID))
            }
            if (sender.tag == 1) {
                DBUtil.sharedInstance.Siparis_onay_update(id: try DBUtil.sharedInstance.getbyId_SU_3(id: k[1])!.get(DBUtil.sharedInstance.TEKLIF_SIPARIS_ID))
            }
            if (sender.tag == 2) {
                DBUtil.sharedInstance.Siparis_onay_update(id: try DBUtil.sharedInstance.getbyId_SU_3(id: k[2])!.get(DBUtil.sharedInstance.TEKLIF_SIPARIS_ID))
            }
            if (sender.tag == 3) {
                DBUtil.sharedInstance.Siparis_onay_update(id: try DBUtil.sharedInstance.getbyId_SU_3(id: k[3])!.get(DBUtil.sharedInstance.TEKLIF_SIPARIS_ID))
            }
            if (sender.tag == 4) {
                DBUtil.sharedInstance.Siparis_onay_update(id: try DBUtil.sharedInstance.getbyId_SU_3(id: k[4])!.get(DBUtil.sharedInstance.TEKLIF_SIPARIS_ID))
            }
            if (sender.tag == 5) {
                DBUtil.sharedInstance.Siparis_onay_update(id: try DBUtil.sharedInstance.getbyId_SU_3(id: k[5])!.get(DBUtil.sharedInstance.TEKLIF_SIPARIS_ID))
            }
            if (sender.tag == 6) {
                DBUtil.sharedInstance.Siparis_onay_update(id: try DBUtil.sharedInstance.getbyId_SU_3(id: k[6])!.get(DBUtil.sharedInstance.TEKLIF_SIPARIS_ID))
            }
            if (sender.tag == 7) {
                DBUtil.sharedInstance.Siparis_onay_update(id: try DBUtil.sharedInstance.getbyId_SU_3(id: k[7])!.get(DBUtil.sharedInstance.TEKLIF_SIPARIS_ID))
            }
        }
        catch{
            print("hata butonkabul")
        }
    }
}
