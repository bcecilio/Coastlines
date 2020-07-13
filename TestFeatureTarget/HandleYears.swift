//
//  HandleYears.swift
//  TestFeatureTarget
//
//  Created by Kelby Mittan on 6/26/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import Foundation
import RealityKit
import RealityUI

struct HandleYears {
    
    static func getYearLabel(sliderVal: Float, scene: DropFlipRiseNYC.RiseSegmentScene) -> Entity {
        
        var yearLabel: Entity?
        
        switch sliderVal {
        case 0.0..<0.2:
            yearLabel = scene.twenty20
        case 0.2..<0.3:
            yearLabel = scene.twenty30
        case 0.3..<0.4:
            yearLabel = scene.twenty40
        case 0.4..<0.5:
            yearLabel = scene.twenty50
        case 0.5..<0.6:
            yearLabel = scene.twenty60
        case 0.6..<0.7:
            yearLabel = scene.twenty70
        case 0.7..<0.8:
            yearLabel = scene.twenty80
        case 0.8..<0.9:
            yearLabel = scene.twenty90
        default:
            yearLabel = scene.twenty100
        }
        
        return yearLabel!
    }
    
    static func showYearLabel(labels: [Entity?], year: Entity) {
        
        for entity in labels {
            if entity == year {
                entity!.isEnabled = true
            } else {
                entity!.isEnabled = false
            }
        }
        
    }
}
