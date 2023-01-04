//
//  YukIlanlari.swift
//  ebsnakliyat2
//
//  Created by Berk on 4.11.2022.
//

import UIKit

class YukIlanlari: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var ad: [String] = []
    var soyad: [String] = []
    var arkap: [String] = []
    var fiy: [String] = []
    
    var j: [Int] = []
    
    var tarih = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do{
            var Arac_Bul_Kalkis_Ilce = try DBUtil.sharedInstance.getById_SI(id: DBUtil.sharedInstance.db_count_SIPARIS_DB())!.get(DBUtil.sharedInstance.KALKIS_ILCE)
            
            var Arac_Bul_Kapasite = try DBUtil.sharedInstance.getById_SI(id: DBUtil.sharedInstance.db_count_SIPARIS_DB())!.get(DBUtil.sharedInstance.ESYA_SAYISI)
            
            var sur_teklif_con: Int
            
            if (DBUtil.sharedInstance.db_count_SURUCU_DB_1() >= 1) {
            for i in 1...DBUtil.sharedInstance.db_count_SURUCU_DB_1() {
                
                sur_teklif_con = try DBUtil.sharedInstance.getbyId_SU_3(id: i)!.get(DBUtil.sharedInstance.TEKLIF_SIPARIS_ID)
                
                if ((DBUtil.sharedInstance.getbyId_SU_i1(id: i, Kal: Arac_Bul_Kalkis_Ilce)) != nil && DBUtil.sharedInstance.getbyId_AR(id: i, Kap: Arac_Bul_Kapasite) != nil && sur_teklif_con == 0) {
                    
                    ad.append(try DBUtil.sharedInstance.getbyId_SU_i1(id: i, Kal: Arac_Bul_Kalkis_Ilce)!.get(DBUtil.sharedInstance.ISIM))
                    
                    soyad.append(try DBUtil.sharedInstance.getbyId_SU_i1(id: i, Kal: Arac_Bul_Kalkis_Ilce)!.get(DBUtil.sharedInstance.SOYISIM))
                    
                    arkap.append(try DBUtil.sharedInstance.getbyId_AR(id: i, Kap: Arac_Bul_Kapasite)!.get(DBUtil.sharedInstance.KAPASITE))
                    
                    fiy.append(try DBUtil.sharedInstance.getbyId_AR_2(id: i)!.get(DBUtil.sharedInstance.UCRET))
                    
                    j.append(i)
                }
            }
            tarih = try DBUtil.sharedInstance.getById_SI(id: DBUtil.sharedInstance.db_count_SIPARIS_DB())!.get(DBUtil.sharedInstance.TARIH)
            }
        }
        catch{
            print("hata bu")
        }
        
        
        tableView.dataSource = self
        
        tableView.showsVerticalScrollIndicator = false
    }
    

}
extension YukIlanlari: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ad.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! YukIlanlariViewCell
    
        let a = ad[indexPath.row]
        cell.Ad_Lable.text = a
        
        let b = soyad[indexPath.row]
        cell.Soyad_Lable.text = b
        
        let c = arkap[indexPath.row]
        cell.Arac_Kap_Lable.text = c
        
        let d = tarih
        cell.Tarih_Lable.text = d
        
        let e = fiy[indexPath.row]
        cell.Fiyat_Lable.text = e
        
        cell.Button_Teklif_Ver.tag = indexPath.row
        cell.Button_Teklif_Ver.addTarget(self, action: #selector(ButtonOnClick(sender:)), for: .touchUpInside)
        
        return cell
    }
    
    @objc func ButtonOnClick (sender:UIButton) {
        if (sender.tag == 0){
            DBUtil.sharedInstance.Siparis_teklif_update(id: DBUtil.sharedInstance.db_count_SIPARIS_DB())
            DBUtil.sharedInstance.Surucu_siparis_id(id: j[0], sip_id: DBUtil.sharedInstance.db_count_SIPARIS_DB())
        }
        if (sender.tag == 1){
            DBUtil.sharedInstance.Siparis_teklif_update(id: DBUtil.sharedInstance.db_count_SIPARIS_DB())
            DBUtil.sharedInstance.Surucu_siparis_id(id: j[1], sip_id: DBUtil.sharedInstance.db_count_SIPARIS_DB())
        }
        if (sender.tag == 2){
            DBUtil.sharedInstance.Siparis_teklif_update(id: DBUtil.sharedInstance.db_count_SIPARIS_DB())
            DBUtil.sharedInstance.Surucu_siparis_id(id: j[2], sip_id: DBUtil.sharedInstance.db_count_SIPARIS_DB())
        }
        if (sender.tag == 3){
            DBUtil.sharedInstance.Siparis_teklif_update(id: DBUtil.sharedInstance.db_count_SIPARIS_DB())
            DBUtil.sharedInstance.Surucu_siparis_id(id: j[3], sip_id: DBUtil.sharedInstance.db_count_SIPARIS_DB())
        }
        if (sender.tag == 4){
            DBUtil.sharedInstance.Siparis_teklif_update(id: DBUtil.sharedInstance.db_count_SIPARIS_DB())
            DBUtil.sharedInstance.Surucu_siparis_id(id: j[4], sip_id: DBUtil.sharedInstance.db_count_SIPARIS_DB())
        }
        if (sender.tag == 5){
            DBUtil.sharedInstance.Siparis_teklif_update(id: DBUtil.sharedInstance.db_count_SIPARIS_DB())
            DBUtil.sharedInstance.Surucu_siparis_id(id: j[5], sip_id: DBUtil.sharedInstance.db_count_SIPARIS_DB())
        }
        if (sender.tag == 6){
            DBUtil.sharedInstance.Siparis_teklif_update(id: DBUtil.sharedInstance.db_count_SIPARIS_DB())
            DBUtil.sharedInstance.Surucu_siparis_id(id: j[6], sip_id: DBUtil.sharedInstance.db_count_SIPARIS_DB())
        }
    }
    
}


