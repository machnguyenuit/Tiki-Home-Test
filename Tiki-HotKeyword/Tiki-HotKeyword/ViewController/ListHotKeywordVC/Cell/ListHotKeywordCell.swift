//
//  ListHotKeywordCell.swift
//  Tiki-HotKeyword
//
//  Created by Apple on 5/16/19.
//  Copyright © 2019 nguyenmach. All rights reserved.
//

import UIKit
import SDWebImage

class ListHotKeywordCell: UICollectionViewCell {
    
    @IBOutlet weak var imgIcon:UIImageView?
    @IBOutlet weak var lblName:UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configura(hotKeyword:KeywordModel,backgroundColor:UIColor)  {
        imgIcon?.setImageWithURL(url: hotKeyword.icon)
        lblName?.text = hotKeyword.keyword
        lblName?.backgroundColor = backgroundColor
        lblName?.textColor = UIColor.white
        lblName?.layer.cornerRadius = 5.0
        lblName?.layer.masksToBounds = true
        lblName?.clipsToBounds = true
    }

}
