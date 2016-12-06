//
//  MainTextField.swift
//  SayCheese
//
//  Created by vincent on 02/12/2016.
//  Copyright © 2016 kodappy. All rights reserved.
//

import UIKit

class MainTextField: UITextField {
    
    override func awakeFromNib() {
    }
    
    override func draw(_ rect: CGRect) {
        let startingPoint = CGPoint(x: rect.minX, y: rect.maxY)
        let endingPoint = CGPoint(x: rect.maxX, y: rect.maxY)
        
        let path = UIBezierPath()
        
        path.move(to: startingPoint)
        path.addLine(to: endingPoint)
        path.lineWidth = 2.0
        
        tintColor = UIColor.white
        tintColor.setStroke()
        
        path.stroke()
    }
    
}
