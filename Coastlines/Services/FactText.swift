//
//  FactText.swift
//  Coastlines
//
//  Created by Kelby Mittan on 6/21/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

public struct FactText {
    static let nycPop1 = "\n481,000 New York residents live on land below 6 feet"
    static let nycPop2 = "\n21% of them live in just 3 zip codes (Manhattan Beach, Coney Island, Far Rockaway)."
    static let nolaPop1 = "\nRising sea levels could displace 500,000 New Orleans area residents"
    static let nolaPop2 = "\nThat's more than one third of the city's current population"
    static let miaPop1 = "\nWith densely populated coastal locales, Florida faces the greatest risk in the U.S."
    static let miaPop2 = "\nUp to 6.06 million residents could be affected if sea levels rise 6 feet"
    static let bgdPop1 = "\nBy 2050, one in every seven people in Bangladesh could be displaced by climate change."
    static let bgdPop2 = "\n28% of the population of Bangladesh lives on the coast"
    
    static func getFact(_ location: Selection) -> (String, String) {
        
        switch location {
        case .newYork:
            return (nycPop1,nycPop2)
        case .newOrleans:
            return (nolaPop1, nolaPop2)
        case .miami:
            return (miaPop1, miaPop2)
        case .bangladesh:
            return (bgdPop1,bgdPop2)
        case .polarIceCaps:
            return ("","")
        }
        
    }
    
}

enum Selection: String {
    case newYork = "New York City"
    case newOrleans = "New Orleans"
    case miami = "Miami"
    case bangladesh = "Bangladesh"
    case polarIceCaps = "Polar Ice Caps"
    
    init(selected: String) {
        switch selected {
        case "New York City":
            self = .newYork
        case "New Orleans":
            self = .newOrleans
        case "Miami":
            self = .miami
        case "Bangladesh":
            self = .bangladesh
        default:
            self = .polarIceCaps
        }
    }
}

public struct ContentText {
    static let didYouKnow = "\nDid you know?"
    static let seaLevels = "\nSea Level Rise"
    static let whatsHappening = "\nWhat is happening?"
    static let popDisplaced = "\nPeople Displaced"
    static let whereWillWeGo = "\nWhere will we go?"
    static let seeInAR = "\nExperience AR"
}

public struct Font {
    static let cooper34 = UIFont(name: "CooperHewitt-Medium", size: 34)
    static let cooper24 = UIFont(name: "CooperHewitt-Medium", size: 24)
    static let cooper20 = UIFont(name: "CooperHewitt-Medium", size: 20)
    static let boldArial24 = UIFont(name: "Arial-BoldMT", size: 24)
    static let boldArial26 = UIFont(name: "Arial-BoldMT", size: 26)
}
