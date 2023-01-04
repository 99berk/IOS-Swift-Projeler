//
//  SuruculerViewController.swift
//  ebsnakliyat2
//
//  Created by Berk on 17.12.2022.
//

import UIKit

class SuruculerViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var ad: [String] = []
    var soyad: [String] = []
    var telefon: [String] = []
    
    var k: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do{
            if (DBUtil.sharedInstance.db_count_SURUCU_DB_1() >= 1) {
            for i in 1...DBUtil.sharedInstance.db_count_SURUCU_DB_1() {
                
                ad.append(try DBUtil.sharedInstance.getbyId_SU_3(id: i)!.get(DBUtil.sharedInstance.ISIM))
                
                soyad.append(try DBUtil.sharedInstance.getbyId_SU_3(id: i)!.get(DBUtil.sharedInstance.SOYISIM))
                
                telefon.append(try DBUtil.sharedInstance.getbyId_SU_3(id: i)!.get(DBUtil.sharedInstance.TELEFON))
                
                k.append(i)
            }
            }
        }
        catch{
            print("error suruculer")
        }
        
        tableView.dataSource = self
        
        tableView.showsVerticalScrollIndicator = false
       
    }


}
extension SuruculerViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ad.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell5") as! SuruculerTableViewCell
        
        let a = ad[indexPath.row]
        cell.Ad_Lable.text = a
        
        let b = soyad[indexPath.row]
        cell.Soyad_Lable.text = b
        
        let c = telefon[indexPath.row]
        cell.Tel_Lable.text = c
        
        cell.Button_SurucuSil.tag = indexPath.row
        cell.Button_SurucuSil.addTarget(self, action: #selector(ButtonOnClick(sender:)), for: .touchUpInside)
        
        return cell
    }
    
    @objc func ButtonOnClick (sender:UIButton) {
        do{
        if (sender.tag == 0) {
            if (try DBUtil.sharedInstance.getbyId_SU_3(id: k[0])!.get(DBUtil.sharedInstance.TEKLIF_SIPARIS_ID) != 0) {
                DBUtil.sharedInstance.Siparis_teklif_update_false(id: try DBUtil.sharedInstance.getbyId_SU_3(id: k[0])!.get(DBUtil.sharedInstance.TEKLIF_SIPARIS_ID))
            }
            DBUtil.sharedInstance.surucu_arac_delete(id: k[0])
            for j in 2...20 {
                DBUtil.sharedInstance.surucu_arac_update_id(id: j)
            }
            
        }
        if (sender.tag == 1) {
            if (try DBUtil.sharedInstance.getbyId_SU_3(id: k[1])!.get(DBUtil.sharedInstance.TEKLIF_SIPARIS_ID) != 0) {
                DBUtil.sharedInstance.Siparis_teklif_update_false(id: try DBUtil.sharedInstance.getbyId_SU_3(id: k[1])!.get(DBUtil.sharedInstance.TEKLIF_SIPARIS_ID))
            }
            DBUtil.sharedInstance.surucu_arac_delete(id: k[1])
            for j in 3...20 {
                DBUtil.sharedInstance.surucu_arac_update_id(id: j)
            }
            
        }
        if (sender.tag == 2) {
            if (try DBUtil.sharedInstance.getbyId_SU_3(id: k[2])!.get(DBUtil.sharedInstance.TEKLIF_SIPARIS_ID) != 0) {
                DBUtil.sharedInstance.Siparis_teklif_update_false(id: try DBUtil.sharedInstance.getbyId_SU_3(id: k[2])!.get(DBUtil.sharedInstance.TEKLIF_SIPARIS_ID))
            }
            DBUtil.sharedInstance.surucu_arac_delete(id: k[2])
            for j in 4...20 {
                DBUtil.sharedInstance.surucu_arac_update_id(id: j)
            }
            
        }
        if (sender.tag == 3) {
            if (try DBUtil.sharedInstance.getbyId_SU_3(id: k[3])!.get(DBUtil.sharedInstance.TEKLIF_SIPARIS_ID) != 0) {
                DBUtil.sharedInstance.Siparis_teklif_update_false(id: try DBUtil.sharedInstance.getbyId_SU_3(id: k[3])!.get(DBUtil.sharedInstance.TEKLIF_SIPARIS_ID))
            }
            DBUtil.sharedInstance.surucu_arac_delete(id: k[3])
            for j in 4...20 {
                DBUtil.sharedInstance.surucu_arac_update_id(id: j)
            }
            
        }
        if (sender.tag == 4) {
            if (try DBUtil.sharedInstance.getbyId_SU_3(id: k[4])!.get(DBUtil.sharedInstance.TEKLIF_SIPARIS_ID) != 0) {
                DBUtil.sharedInstance.Siparis_teklif_update_false(id: try DBUtil.sharedInstance.getbyId_SU_3(id: k[4])!.get(DBUtil.sharedInstance.TEKLIF_SIPARIS_ID))
            }
            DBUtil.sharedInstance.surucu_arac_delete(id: k[4])
            for j in 5...20 {
                DBUtil.sharedInstance.surucu_arac_update_id(id: j)
            }
            
        }
            if (sender.tag == 5) {
                if (try DBUtil.sharedInstance.getbyId_SU_3(id: k[5])!.get(DBUtil.sharedInstance.TEKLIF_SIPARIS_ID) != 0) {
                    DBUtil.sharedInstance.Siparis_teklif_update_false(id: try DBUtil.sharedInstance.getbyId_SU_3(id: k[5])!.get(DBUtil.sharedInstance.TEKLIF_SIPARIS_ID))
                }
                DBUtil.sharedInstance.surucu_arac_delete(id: k[5])
                for j in 6...20 {
                    DBUtil.sharedInstance.surucu_arac_update_id(id: j)
                }
                
            }
            if (sender.tag == 6) {
                if (try DBUtil.sharedInstance.getbyId_SU_3(id: k[6])!.get(DBUtil.sharedInstance.TEKLIF_SIPARIS_ID) != 0) {
                    DBUtil.sharedInstance.Siparis_teklif_update_false(id: try DBUtil.sharedInstance.getbyId_SU_3(id: k[6])!.get(DBUtil.sharedInstance.TEKLIF_SIPARIS_ID))
                }
                DBUtil.sharedInstance.surucu_arac_delete(id: k[6])
                for j in 7...20 {
                    DBUtil.sharedInstance.surucu_arac_update_id(id: j)
                }
                
            }
            if (sender.tag == 7) {
                if (try DBUtil.sharedInstance.getbyId_SU_3(id: k[7])!.get(DBUtil.sharedInstance.TEKLIF_SIPARIS_ID) != 0) {
                    DBUtil.sharedInstance.Siparis_teklif_update_false(id: try DBUtil.sharedInstance.getbyId_SU_3(id: k[7])!.get(DBUtil.sharedInstance.TEKLIF_SIPARIS_ID))
                }
                DBUtil.sharedInstance.surucu_arac_delete(id: k[7])
                for j in 8...20 {
                    DBUtil.sharedInstance.surucu_arac_update_id(id: j)
                }
                
            }
            if (sender.tag == 8) {
                if (try DBUtil.sharedInstance.getbyId_SU_3(id: k[8])!.get(DBUtil.sharedInstance.TEKLIF_SIPARIS_ID) != 0) {
                    DBUtil.sharedInstance.Siparis_teklif_update_false(id: try DBUtil.sharedInstance.getbyId_SU_3(id: k[8])!.get(DBUtil.sharedInstance.TEKLIF_SIPARIS_ID))
                }
                DBUtil.sharedInstance.surucu_arac_delete(id: k[8])
                for j in 9...20 {
                    DBUtil.sharedInstance.surucu_arac_update_id(id: j)
                }
                
            }
        }
        catch{
            print("error")
        }
        
    }
    
}
