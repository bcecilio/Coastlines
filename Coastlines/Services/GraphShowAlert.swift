//
//  GraphShowAlert.swift
//  Coastlines
//
//  Created by Kelby Mittan on 6/21/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

struct GraphShowAlert {
    static func makeAlert(year: Double, rise: Double, vc: UIViewController) -> UIAlertController {
        
        let forYear = self.imageObjectHelper(year: year)
        
        let showAlert = UIAlertController(title: "By \(Int(year)) sea levels could rise as much as \(Int(rise) + 1) inches", message: forYear.thing, preferredStyle: .alert)
        
        showAlert.setTitle(font: Font.boldArial24, color: PaletteColour.lightGreen.colour)
        showAlert.setMessage(font: Font.boldArial24, color: PaletteColour.lightBlue.colour)
        showAlert.setBackgroudColor(color: PaletteColour.offWhite.colour)
        showAlert.title?.accessibilityLabel = showAlert.title
        showAlert.title?.accessibilityTraits = .none
        showAlert.message?.accessibilityLabel = forYear.thing
        showAlert.message?.accessibilityTraits = .none
        showAlert.view.tintColor = PaletteColour.peach.colour
        
        let height = NSLayoutConstraint(item: showAlert.view!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 380)
        let width = NSLayoutConstraint(item: showAlert.view!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 350)
        showAlert.view.addConstraint(height)
        showAlert.view.addConstraint(width)
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: forYear.img)
        imageView.contentMode = .scaleToFill
        showAlert.view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: showAlert.view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: showAlert.view.centerYAnchor, constant: 55).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 140).isActive = true
        imageView.layer.cornerRadius = 4
        imageView.clipsToBounds = true
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = vc.view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        vc.view.addSubview(blurEffectView)
        
        showAlert.addAction(UIAlertAction(title: "cancel", style: .default, handler: { action in
            blurEffectView.removeFromSuperview()
        }))
        return showAlert
    }
    
    static func imageObjectHelper(year: Double) -> (img: String, thing: String) {
        
        let yearInt = Int(year)
        
        switch yearInt {
        case 2020:
            return ("2020", "\nThat's not much but wait...")
        case 2025:
            return ("2025", "\nThat's the diameter of a pool ball!")
        case 2030:
            return ("2030", "\nThat's almost as tall as an iPhone!")
        case 2035:
            return ("2035", "\nThat's more than a new pencil!")
        case 2040:
            return ("2040", "\nThat's almost a whole ruler!")
        case 2045:
            return ("2045", "\nThat's the size of a bowling pin!")
        case 2050:
            return ("2050", "\nThat's the diameter of a dartboard!")
        case 2055:
            return ("2055", "\nThat's as tall as a labrador!")
        case 2060:
            return ("2060", "\nThat's more than 3 basketballs")
        case 2065:
            return ("2065", "\nThat's the size of a person's footstep!")
        case 2070:
            return ("2070", "\nThat's the height of a kitchen counter!")
        case 2075:
            return ("2075", "\nThat's as high as a guitar is long!")
        case 2080:
            return ("2080", "\nThat's the height of a mailbox!")
        case 2085:
            return ("2085", "\nThat's as tall as Napoleon!")
        case 2090:
            return ("2090", "\nThat's the height of a VW Beetle!")
        case 2095:
            return ("2095", "\nThat's more than the height of a cow!")
        case 2100:
            return ("21002", "\nThat's more than a refrigerator!")
        default:
            return ("nycPopDisplacedd", "")
        }
    }
}
