//
//  GlobalConstants.swift
//  Coastlines
//
//  Created by Cameron Rivera on 5/29/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

/// Contains a key for onboarding experience logic. 
public struct OnboardingKey{
    static let ftuexKey = "ftuex" // First Time User Experience
}

/// A struct used to centralize all onboarding label text.
public struct OnboardingText{
    static let appTitle = "Welcome to Coasts"
    static let welcomeMessage = """
Thank you for installing this application. Before you begin your experience, we'd like to take a moment to inform you a bit about climate change and its effect on the global sea level.

Alternatively, if you are a climate change expert, you can go ahead and skip the introductory portion of this application.
"""
    static let firstOnboardingLabel = "As the global temperature increases, the ice caps begin to melt, and the world’s oceans begin to heat up, which causes the sea level to rise."
    static let secondOnboaringLabel = "Historically, a rise and fall in the Earth’s sea levels is not uncommon. However, the sea level has never risen at a rate that we have seen in recent years."
    static let thirdOnboardingLabel = "Roughly 40% of the world’s population lives near Coastal Regions. If the sea level continues to rise at this rate, our coasts will slowly recede."
    static let fourthOnboardingLabel = "With that, you are now ready to explore locations around the world to learn more about the impact of rising sea levels."
    
}

/// A description of the locations in the locationsVC. For accessibility purposes.
public struct LocationDescription{
    static let nycImage = "A yellow taxi cab is shown waiting at a busy new york city corner."
    static let nycImageValue = "Tap to learn more about how the rising sea level will affect nyc."
    static let newOrleansImage = "A view of buildings is shown from a high vantage point."
    static let newOrleansValue = "Tap to learn more about how the rising sea level will affect New Orleans."
    static let floridaImage = "A Miami beach with clear blue water is shown extending into the distance."
    static let floridaValue = "Tap to learn more about how the rising sea level will affect Miami."
    static let bangladeshImage = "A view of buildings is shown from a high vantage point. The scene is bathed in the light of a bangladesh sunset."
    static let bangladeshValue = "Tap to learn more about how the rising sea level will affect Bangladesh."
}

/// An enum containing hex vaules that correspond to colours from the chosen colour palette.
enum PaletteColour: String{
    case offWhite = "#f9f7e3"
    case lightBlue = "#a1c5c5"
    case lightGreen = "#a9bd95"
    case peach = "#e2a093"
    case pink = "#c67eb2"
    case darkBlue = "#3e54c7"
    case black = "#000000"
    
    var colour: UIColor{
        guard self.rawValue.count == 7 else { return UIColor.black }
        var hexTuple: (Int,Int,Int) = (0,0,0)
        hexTuple.0 = Int(self.rawValue[self.rawValue.index(self.rawValue.startIndex, offsetBy: 1)...self.rawValue.index(self.rawValue.startIndex, offsetBy: 2)], radix: 16) ?? 0
        hexTuple.1 = Int(self.rawValue[self.rawValue.index(self.rawValue.startIndex, offsetBy: 3)...self.rawValue.index(self.rawValue.startIndex, offsetBy: 4)], radix: 16) ?? 0
        hexTuple.2 = Int(self.rawValue[self.rawValue.index(self.rawValue.startIndex, offsetBy: 5)...self.rawValue.index(self.rawValue.startIndex, offsetBy: 6)], radix: 16) ?? 0
        return UIColor(red: CGFloat(hexTuple.0) / 255.0, green: CGFloat(hexTuple.1) / 255.0, blue: CGFloat(hexTuple.2) / 255.0, alpha: 1.0)
    }
}
