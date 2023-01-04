//
//  YukIlanlariViewCell.swift
//  ebsnakliyat2
//
//  Created by Berk on 4.11.2022.
//

import UIKit

class YukIlanlariViewCell: UITableViewCell {
    
    @IBOutlet weak var Title_EBSN: UILabel!
    @IBOutlet weak var SRC_IMG: UIImageView!
    @IBOutlet weak var Title_AdSo: UILabel!
    @IBOutlet weak var Ad_Lable: UILabel!
    @IBOutlet weak var Soyad_Lable: UILabel!
    @IBOutlet weak var Title_ArKa: UILabel!
    @IBOutlet weak var Arac_Kap_Lable: UILabel!
    @IBOutlet weak var Title_Tarih: UILabel!
    @IBOutlet weak var Tarih_Lable: UILabel!
    @IBOutlet weak var Title_Fi: UILabel!
    @IBOutlet weak var Fiyat_Lable: UILabel!
    @IBOutlet weak var Button_Teklif_Ver: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
