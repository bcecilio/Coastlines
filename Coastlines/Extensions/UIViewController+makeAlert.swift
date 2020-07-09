//
//  UIViewController+ShowAlert.swift
//  Coastlines
//
//  Created by Cameron Rivera on 7/9/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func makeAlert(_ title: String?, _ message: String?, _ font: UIFont?, _ colour: UIColor) -> UIAlertController {
        
        var comingSoonAlert = UIAlertController()
        comingSoonAlert = GraphShowAlert.makeAlert(year: 0, rise: 0, vc: self)
        
        comingSoonAlert.title = title
        comingSoonAlert.message = message
        
        comingSoonAlert.setTitle(font: font, color: colour)
        comingSoonAlert.setMessage(font: font, color: colour)
        
        return comingSoonAlert
    }
}
