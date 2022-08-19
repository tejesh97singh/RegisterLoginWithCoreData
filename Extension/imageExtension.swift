//
//  imageExtension.swift
//  RegisterLoginCoreData
//
//  Created by Tejesh Singh on 24/06/22.
//

import Foundation
import UIKit

class ForImageView:UIImageView{
    public var forBorderWidth: CGFloat = 0.0
    @IBInspectable public var borderWidth: CGFloat{
        set {
            layer.borderWidth = newValue
            forBorderWidth = newValue
        }
        get { return self.forBorderWidth }
        
    }
    public var forCornerRadius: CGFloat = 0.0
    @IBInspectable public var cornerRadius: CGFloat{
        set {
            layer.cornerRadius = newValue
            forCornerRadius = newValue
        }
        get { return self.forCornerRadius }
        
    }
    public var forUIColor: UIColor = UIColor.clear
    @IBInspectable public var borderColor: UIColor{
        set {
            layer.borderColor = newValue.cgColor
            forUIColor = newValue
        }
        get { return self.forUIColor }
        
    }
     
}

extension UIImageView{
    func applyBlurEffect() {
       let blurEffect = UIBlurEffect(style: .light)
       let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        self.addSubview(blurEffectView)
   }
}




