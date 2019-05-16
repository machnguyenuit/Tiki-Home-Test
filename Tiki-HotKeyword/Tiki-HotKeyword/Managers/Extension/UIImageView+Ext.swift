//
//  UIImageView+Ext.swift
//  Tiki-HotKeyword
//
//  Created by Apple on 5/16/19.
//  Copyright © 2019 nguyenmach. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func setImageWithURL(url:String?,
                         placeHolderImage:UIImage? = nil,
                         complateDownload:((UIImage?,Error?)-> Void)? = nil)  {
        
        if let _url = url {
            
            self.sd_setImage(with: URL(string: _url),
                             placeholderImage: placeHolderImage,
                             options: [.allowInvalidSSLCertificates,
                                       .retryFailed,
                                       .refreshCached],
                             progress: nil) {(image, error, cacheType, url) in
                                complateDownload?(image,error)
            }
        }else {
            self.image = placeHolderImage
        }
    }
}
