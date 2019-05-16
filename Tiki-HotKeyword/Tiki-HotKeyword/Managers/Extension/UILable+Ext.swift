//
//  UILable+Ext.swift
//  Tiki-HotKeyword
//
//  Created by Apple on 5/16/19.
//  Copyright © 2019 nguyenmach. All rights reserved.
//

import Foundation
import UIKit

extension UILabel{
    func getWidthLable(text:String,font:UIFont) -> CGFloat {
        let label:UILabel = UILabel(frame: CGRect(x: 0,
                                                  y: 0,
                                                  width:CGFloat.greatestFiniteMagnitude,
                                                  height: self.frame.height))
        label.numberOfLines = 2
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.text = text
        label.font = font
        label.sizeToFit()
        
        return label.frame.width
    }
}
