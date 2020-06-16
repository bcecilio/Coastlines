//
//  SeaLevelComputations.swift
//  TestFeatureTarget
//
//  Created by Kelby Mittan on 6/16/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import Foundation
import RealityKit
import RealityUI

struct CompSeaLevel {
    
    static func riseDropCalc(sliderVal: Float, entity: Entity?) -> Transform? {
        
        var transform = entity?.transform
        
        switch sliderVal {
        case 0.0..<0.2:
            transform?.translation = [-0.25,0.041,0.14]
            transform?.scale = [1,1,1]
        case 0.2..<0.3:
            break
        case 0.3..<0.4:
            break
        case 0.4..<0.5:
            break
        case 0.5..<0.6:
            break
        case 0.6..<0.7:
            break
        case 0.7..<0.8:
            break
        case 0.8..<0.9:
            break
        default:
            transform?.translation = [-0.17,0.041,0.02]
            transform?.scale = [4,1,4]
        }
        
        return transform
    }
}

