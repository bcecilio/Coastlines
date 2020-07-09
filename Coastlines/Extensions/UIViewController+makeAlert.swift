//
//  UIViewController+ShowAlert.swift
//  Coastlines
//
//  Created by Cameron Rivera on 7/9/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /**
     Creates an Alert, which will ideally be presented.
     
     - Parameters:
        - title: A string representing the title of the alert.
        - message: A string representing the text that will be displayed in the message portion of the alert.
        - font: The font used to represent the text displayed in the alert.
        - colour: The colour of the font being displayed in the alert.
     
     */
    
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
