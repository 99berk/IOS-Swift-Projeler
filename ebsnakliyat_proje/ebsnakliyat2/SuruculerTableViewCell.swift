//
//  SuruculerTableViewCell.swift
//  ebsnakliyat2
//
//  Created by Berk on 17.12.2022.
//

import UIKit

class SuruculerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var Title_SurucuAdi: UILabel!
    @IBOutlet weak var Ad_Lable: UILabel!
    @IBOutlet weak var Soyad_Lable: UILabel!
    @IBOutlet weak var Title_SurucuTel: UILabel!
    @IBOutlet weak var Tel_Lable: UILabel!
    @IBOutlet weak var Button_SurucuSil: UIButton!
    @IBOutlet weak var Img_Title: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
