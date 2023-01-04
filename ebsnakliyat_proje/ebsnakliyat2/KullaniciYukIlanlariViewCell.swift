//
//  KullaniciYukIlanlariViewCell.swift
//  ebsnakliyat2
//
//  Created by Berk on 16.11.2022.
//

import UIKit

class KullaniciYukIlanlariViewCell: UITableViewCell {
    
    @IBOutlet weak var Kalkis_Ilce_Lable: UILabel!
    @IBOutlet weak var Ok_img: UIImageView!
    @IBOutlet weak var Varis_Ilce_Lable: UILabel!
    @IBOutlet weak var Esya_Sayisi_Lable: UILabel!
    @IBOutlet weak var Fiyat_Lable: UILabel!
    @IBOutlet weak var Button_KabulEt: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
