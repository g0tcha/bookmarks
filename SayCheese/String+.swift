//
//  String+.swift
//  SayCheese
//
//  Created by vincent on 02/12/2016.
//  Copyright © 2016 kodappy. All rights reserved.
//

import Foundation

extension String {
    func isEmpty() -> Bool {
        if self.characters.count == 0 {
            return true
        }
        
        return false
    }
}
