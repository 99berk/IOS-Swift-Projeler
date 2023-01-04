//
//  Siparislerim.swift
//  ebsnakliyat2
//
//  Created by Berk on 16.11.2022.
//

import UIKit

class Siparislerim: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var ad: [String] = []
    var soyad: [String] = []
    var tel: [String] = []
    var tar: [String] = []
    var ucret: [String] = []
    
    var ony: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        do{
            if (DBUtil.sharedInstance.db_count_SIPARIS_DB() >= 1) {
            for i in 1...DBUtil.sharedInstance.db_count_SIPARIS_DB() {
                
                if (try DBUtil.sharedInstance.getById_SI(id: i)!.get(DBUtil.sharedInstance.SIPARIS_TEKLIF) == true) {
                    
                    ad.append(try DBUtil.sharedInstance.getbyId_SU_5(sip_id: i)!.get(DBUtil.sharedInstance.ISIM))
                    
                    soyad.append(try DBUtil.sharedInstance.getbyId_SU_5(sip_id: i)!.get(DBUtil.sharedInstance.SOYISIM))
                    
                    tel.append(try DBUtil.sharedInstance.getbyId_SU_5(sip_id: i)!.get(DBUtil.sharedInstance.TELEFON))
                    
                    tar.append(try DBUtil.sharedInstance.getById_SI(id: i)!.get(DBUtil.sharedInstance.TARIH))
                    
                    ucret.append(try DBUtil.sharedInstance.getbyId_AR_2(id: try DBUtil.sharedInstance.getbyId_SU_5(sip_id: i)!.get(DBUtil.sharedInstance.SURUCU_ID))!.get(DBUtil.sharedInstance.UCRET))
    
                    if (try DBUtil.sharedInstance.getById_SI(id: i)!.get(DBUtil.sharedInstance.SIPARIS_ONAY) == true){
                        ony.append("Kabul")
                    }
                    else{
                        ony.append("Onay Bekliyor")
                    }
                    
                }
                
            }
            }
            
        }
        catch{
            print("hata 9s")
        }
        
        tableView.dataSource = self
        
        tableView.showsVerticalScrollIndicator = false
    }
    
}

extension Siparislerim: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ad.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell3") as! SiparislerimViewCell
        
        let a = ad[indexPath.row]
        cell.Ad_Lable.text = a
        
        let b = soyad[indexPath.row]
        cell.Soyad_Lable.text = b
        
        let c = tel[indexPath.row]
        cell.Telefon_No_Lable.text = c
        
        let d = tar[indexPath.row]
        cell.Tarih_Lable.text = d
        
        let e = ucret[indexPath.row]
        cell.Fiyat_Lable.text = e + "TL"
        
        let f = ony[indexPath.row]
        cell.Durum_Lable.text = f
        
        return cell
    }
    
}
