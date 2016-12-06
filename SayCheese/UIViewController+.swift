//
//  UIViewController+.swift
//  SayCheese
//
//  Created by vincent on 02/12/2016.
//  Copyright © 2016 kodappy. All rights reserved.
//

import UIKit

extension UIViewController {
    // -- Display a simple alert.
    func displaySimpleAlert(withTitle title: String, andMessage message: String) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertViewController.addAction(okAction)
        
        present(alertViewController, animated: true, completion: nil)
    }
    
    func displaySimpleAlert(withTitle title: String, andMessage message: String, withCompletionHandler completionHandler: @escaping () -> Void) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { (alert) in
            completionHandler()
        }
        
        alertViewController.addAction(okAction)
        
        present(alertViewController, animated: true, completion: nil)
    }
}
