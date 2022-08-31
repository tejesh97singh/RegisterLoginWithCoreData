//
//  ImageBlurEffect extension.swift
//  RegisterLoginCoreData
//
//  Created by Tejesh singh on 21/08/22.
//

import Foundation
import UIKit

extension UIImageView{
    func applyBlurEffect() {
       let blurEffect = UIBlurEffect(style: .light)
       let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        self.addSubview(blurEffectView)
   }
}
