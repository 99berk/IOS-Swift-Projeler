//
//  SiparislerimViewCell.swift
//  ebsnakliyat2
//
//  Created by Berk on 16.11.2022.
//

import UIKit

class SiparislerimViewCell: UITableViewCell {
    
    @IBOutlet weak var Title_Surucu_ad: UILabel!
    @IBOutlet weak var Ad_Lable: UILabel!
    @IBOutlet weak var Soyad_Lable: UILabel!
    @IBOutlet weak var Title_Surucu_num: UILabel!
    @IBOutlet weak var Telefon_No_Lable: UILabel!
    @IBOutlet weak var Title_Tarih: UILabel!
    @IBOutlet weak var Tarih_Lable: UILabel!
    @IBOutlet weak var Durum_Lable: UILabel!
    @IBOutlet weak var Fiyat_Lable: UILabel!
    @IBOutlet weak var Static_Img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
