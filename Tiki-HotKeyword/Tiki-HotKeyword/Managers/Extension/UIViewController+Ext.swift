//
//  UIViewController+Ext.swift
//  Tiki-HotKeyword
//
//  Created by Apple on 5/16/19.
//  Copyright © 2019 nguyenmach. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD

extension UIViewController {
    
    func showLoadingIndicator() {
        SVProgressHUD.show()
    }
    
    func dismissLoadingIndicator() {
        SVProgressHUD.dismiss()
    }
}
