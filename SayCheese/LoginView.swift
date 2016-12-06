//
//  LoginView.swift
//  SayCheese
//
//  Created by vincent on 02/12/2016.
//  Copyright © 2016 kodappy. All rights reserved.
//

import UIKit

class LoginView: UIView {
    var gradientLayer: CAGradientLayer!
    let startColor = UIColor(red: 23/255, green: 138/255, blue: 157/255, alpha: 1).cgColor
    let endColor = UIColor(red: 45/255, green: 189/255, blue: 181/255, alpha: 1).cgColor
    
    override func awakeFromNib() {
        createGradientLayer()
    }
    
    func createGradientLayer() {
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [startColor, endColor]
        layer.addSublayer(gradientLayer)
    }
}
