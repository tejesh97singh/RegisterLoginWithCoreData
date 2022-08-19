//
//  labelExtension.swift
//  RegisterLoginCoreData
//
//  Created by Tejesh Singh on 27/06/22.
//

import Foundation
import UIKit

class ForLabel: UILabel{
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
    public var forLabelColor: UIColor = UIColor.clear
    @IBInspectable public var borderColor: UIColor {
        set {
            layer.borderColor = newValue.cgColor
            forLabelColor = newValue
        }
        get { return self.forLabelColor }
    }
    
}
