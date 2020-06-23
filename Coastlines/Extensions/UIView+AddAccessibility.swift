//
//  UIView+AddAccessibility.swift
//  Coastlines
//
//  Created by Cameron Rivera on 6/22/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

extension UIView{
    /**
     - Description:
     Adds accessiblity to a UIElement. Since most UIElements inherit from UIView, this can be used on anything from a label, to a UICollectionViewCell.
     
     - Parameters:
        - trait: A set of accessibility traits that describes how an element behaves. Examples include, button, image, and plays sound. For a label, you'll want to set this value to .none.
        - label: The text that voiceOver will read when the user selects an element.
        - hint: Briefly describes the result of performing an action on an accessibility element
        - isAccessible: Indicates whether the accessibility element is an assistive application can access.
        - value: Represents the current value of the accessibility element. For example, a slider might have a value of 10. If this is applied to a text field, it is the text that the field contains.
 */
    func addAccessibility(_ trait: UIAccessibilityTraits, _ label: String, _ hint: String?, _ value: String?, _ isAccessibile: Bool = true){
        self.accessibilityTraits = trait
        self.accessibilityLabel = label
        self.accessibilityHint = hint
        self.isAccessibilityElement = isAccessibile
        self.accessibilityValue = value
    }
    
}
