//
//  DBUtil.swift
//  ebsnakliyat2
//
//  Created by Berk on 1.11.2022.
//

import Foundation
import SQLite

class DBUtil {
    static var sharedInstance = DBUtil()
    var db: Connection?
    
    let SURUCU_DB = Table("SURUCU_DB")
    let SURUCU_ID = Expression<Int>("SURUCU_ID")
    let ISIM = Expression<String>("ISIM")
    let SOYISIM = Expression<String>("SOYISIM")
    let TELEFON = Expression<String>("TELEFON")
    let ILCE = Expression<String>("ILCE")
    let TEKLIF_SIPARIS_ID = Expression<Int>("TEKLIF_SIPARIS_ID")
    
    let SIPARIS_DB = Table("SIPARIS_DB")
    let SIPARIS_ID = Expression<Int>("SIPARIS_ID")
    let KALKIS_ILCE = Expression<String>("KALKIS_ILCE")
    let VARIS_ILCE = Expression<String>("VARIS_ILCE")
    let ESYA_SAYISI = Expression<String>("ESYA_SAYISI")
    let TARIH = Expression<String>("TARIH")
    let SIPARIS_ONAY = Expression<Bool>("SIPARIS_ONAY")
    let SIPARIS_TEKLIF = Expression<Bool>("SIPARIS_TEKLİF")
    
    let ARAC_DB = Table("ARAC_DB")
    let ARAC_ID = Expression<Int>("ARAC_ID")
    let UCRET = Expression<String>("UCRET")
    let KAPASITE = Expression<String>("KAPASITE")
    
    let KULLANICI_DB = Table("KULLAMICI_DB")
    let KULLANICI_ID = Expression<Int>("KULLANICI_ID")
    let KULLANICI_ISIM_SOYISIM = Expression<String>("KULLANICI_ISIM_SOYISIM")
    let KART_NUMARASI = Expression<String>("KART_NUMARASI")
    let SKT = Expression<String>("SKT")
    let CVV = Expression<String>("CVV")

    init() {
        var path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        print(path)
        do
        {
            db = try Connection("\(path)/ebs2.sqlite3")
            
            try db!.run(SURUCU_DB.create(temporary: false, ifNotExists: true, block: {
                t in
                t.column(SURUCU_ID,primaryKey: true)
                t.column(ISIM)
                t.column(SOYISIM)
                t.column(TELEFON)
                t.column(ILCE)
                t.column(TEKLIF_SIPARIS_ID)
            }))
            
            try db!.run(SIPARIS_DB.create(temporary: false, ifNotExists: true, block: {
                k in
                k.column(SIPARIS_ID, primaryKey: true)
                k.column(KALKIS_ILCE)
                k.column(VARIS_ILCE)
                k.column(ESYA_SAYISI)
                k.column(TARIH)
                k.column(SIPARIS_ONAY)
                k.column(SIPARIS_TEKLIF)
            }))
            
            try db!.run(ARAC_DB.create(temporary: false, ifNotExists: true, block: {
                j in
                j.column(ARAC_ID, primaryKey: true)
                j.column(KAPASITE)
                j.column(UCRET)
            }))
            
            try db!.run(KULLANICI_DB.create(temporary: false, ifNotExists: true, block: {
                l in
                l.column(KULLANICI_ID, primaryKey: true)
                l.column(KULLANICI_ISIM_SOYISIM)
                l.column(KART_NUMARASI)
                l.column(SKT)
                l.column(CVV)
            }))
        }
        catch
        {
            print("Hata")
        }
    }
    
    func saveKullanıcı(isim:String, kartNo:String, skt:String, cvv:String) {
        do{
            try db!.run(KULLANICI_DB.insert(KULLANICI_ISIM_SOYISIM <- isim, KART_NUMARASI <- kartNo, SKT <- skt, CVV <- cvv))
        }
        catch{
            print("Veri tabani ekleme hatasi \(error)")
        }
    }
    
    func saveSurucu(isim:String, soyisim:String, telefon:String, ilce:String, teklif_siparis_id: Int) {
        do{
            try db!.run(SURUCU_DB.insert(ISIM <- isim, SOYISIM <- soyisim, TELEFON <- telefon, ILCE <- ilce, TEKLIF_SIPARIS_ID <- teklif_siparis_id))
        }catch{
            print("Veri tabani ekleme hatasi \(error)");
        }
    }
    
    func saveArac(kapasite:String, ucret:String) {
        do{
            try db!.run(ARAC_DB.insert(KAPASITE <- kapasite, UCRET <- ucret))
        }catch{
            print("Veri tabani ekleme hatasi \(error)");
        }
    }
    
    func saveSiparis(kalkıs: String, varis: String, esya: String, tarih: String, onay: Bool, teklif: Bool) {
        do {
            try db!.run(SIPARIS_DB.insert(KALKIS_ILCE <- kalkıs, VARIS_ILCE <- varis, ESYA_SAYISI <- esya, TARIH <- tarih, SIPARIS_ONAY <- onay, SIPARIS_TEKLIF <- teklif))
        } catch{
            print("Veri tabani ekleme hatasi \(error)")
        }
    }
    
    func getById_SI (id: Int) -> Row? {
        do {
            let query = SIPARIS_DB.filter(SIPARIS_ID == id)
            var data = try db!.pluck(query)
            return data
        }
        catch {
            print("Get by Id Error : \(error)")
            return nil
        }
    }
    
    func getbyId_SU (id: Int, Kal: String) -> Row? {
        do {
            let query = SURUCU_DB.filter(ILCE == Kal)
            var data = try db!.pluck(query)
            return data
        }
        catch {
            print("Get by Id Error : \(error)")
            return nil
        }    }
    
    func getbyId_SU_3 (id: Int) -> Row? {
        do {
            let query = SURUCU_DB.filter(SURUCU_ID == id)
            var data = try db!.pluck(query)
            return data
        }
        catch {
            print("Get by Id Error : \(error)")
            return nil
        }    }
    
    func surucu_arac_delete (id: Int) {
        do{
            let s = SURUCU_DB.filter(SURUCU_ID == id)
            let a = ARAC_DB.filter(ARAC_ID == id)
            try db!.run(s.delete())
            try db!.run(a.delete())
        }
        catch{
            print("hataa")
        }
    }
    
    func surucu_arac_update_id (id: Int) {
        do{
            let sur = SURUCU_DB.filter(SURUCU_ID == id)
            let arc = ARAC_DB.filter(ARAC_ID == id)
            try db!.run(sur.update(SURUCU_ID <- (id-1)))
            try db!.run(arc.update(ARAC_ID <- (id-1)))
        }
        catch
        {
            print("error idup")
        }
    }
    
    func getbyId_SU_5 (sip_id: Int) -> Row? {
        do {
            let query = SURUCU_DB.filter(TEKLIF_SIPARIS_ID == sip_id)
            var data = try db!.pluck(query)
            return data
        }
        catch {
            print("Get by Id Error : \(error)")
            return nil
        }    }
    
    func getbyId_AR_2 (id: Int) -> Row? {
        do {
            let query = ARAC_DB.filter(ARAC_ID == id)
            var data = try db!.pluck(query)
            return data
        }
        catch {
            print("Get by Id Error : \(error)")
            return nil
        }    }
    
    func getbyId_SU_i1 (id: Int, Kal: String) -> Row? {
        do {
            let query = SURUCU_DB.filter(SURUCU_ID == id).filter(ILCE == Kal)
            var data = try db!.pluck(query)
            return data
        }
        catch {
            print("Get by Id Error : \(error)")
            return nil
        }    }
    
    func getbyId_AR (id: Int, Kap: String) -> Row? {
        do {
            let query = ARAC_DB.filter(ARAC_ID == id).filter(KAPASITE == Kap)
            var data = try db!.pluck(query)
            return data
        }
        catch {
            print("Get by Id Error : \(error)")
            return nil
        }    }
    
    func db_count_SURUCU_DB (Kal: String) -> Int {
        do {
            let count = try db!.scalar(SURUCU_DB.filter(ILCE == Kal).count)
            return count
        }
        catch {
            print("Get by Id Error : \(error)")
            return 0
        }
    }
    
    func db_count_SURUCU_DB_1 () -> Int {
        do {
            let count = try db!.scalar(SURUCU_DB.count)
            return count
        }
        catch {
            print("Get by Id Error : \(error)")
            return 0
        }
    }
    
    func db_count_SIPARIS_DB () -> Int {
        do {
            let count = try db!.scalar(SIPARIS_DB.count)
            return count
        }
        catch {
            print("Get by Id Error : \(error)")
            return 0
        }
    }
    
    func Siparis_teklif_update (id: Int) {
        do {
            let tmp = SIPARIS_DB.filter(SIPARIS_ID == id)
            try db!.run(tmp.update(SIPARIS_TEKLIF <- true))
        }
        catch {
            print("hata sip_tek_upd")
        }
    }
    
    func Siparis_teklif_update_false (id: Int) {
        do {
            let tmp = SIPARIS_DB.filter(SIPARIS_ID == id)
            try db!.run(tmp.update(SIPARIS_TEKLIF <- false))
        }
        catch {
            print("hata sip_tek_upd")
        }
    }
    
    func Siparis_onay_update (id: Int) {
        do {
            let asd = SIPARIS_DB.filter(SIPARIS_ID == id)
            try db!.run(asd.update(SIPARIS_ONAY <- true))
        }
        catch {
            print("hata sip_onay_upd")
        }
    }
    
    func Surucu_siparis_id (id: Int, sip_id: Int) {
        do {
            let swp = SURUCU_DB.filter(SURUCU_ID == id)
            try db!.run(swp.update(TEKLIF_SIPARIS_ID <- sip_id))
        }
        catch{
            print("hata Sur_sip_id")
        }
    }
    
}
