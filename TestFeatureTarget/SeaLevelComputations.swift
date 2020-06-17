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
    
    static func riseDropOne(sliderVal: Float, entity: Entity?) -> Transform? {
        
        var transform = entity?.transform
        
        switch sliderVal {
        case 0.0..<0.2:
            transform?.translation = [-0.31,0.041,-0.02]
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
            transform?.translation = [-0.213,0.041,-0.09]
            transform?.scale = [4,1,4]
        }
        return transform
    }
    
    static func riseDropTwo(sliderVal: Float, entity: Entity?) -> Transform? {
        
        var transform = entity?.transform
        
        switch sliderVal {
        case 0.0..<0.2:
            transform?.translation = [-0.31,0.041,0.05]
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
            transform?.translation = [-0.24,0.041,-0.03]
            transform?.scale = [3,1,3]
        }
        return transform
    }
    
    static func riseDropThree(sliderVal: Float, entity: Entity?) -> Transform? {
        
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
    
    static func riseDropFour(sliderVal: Float, entity: Entity?) -> Transform? {
        
        var transform = entity?.transform
        
        switch sliderVal {
        case 0.0..<0.2:
            transform?.translation = [-0.16,0.041,0.17]
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
            transform?.translation = [-0.145,0.041,0.10]
            transform?.scale = [3.25,1,3.25]
        }
        return transform
    }
    
    static func riseDropFive(sliderVal: Float, entity: Entity?) -> Transform? {
        
        var transform = entity?.transform
        
        switch sliderVal {
        case 0.0..<0.2:
            transform?.translation = [-0.10,0.041,0.155]
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
            transform?.translation = [-0.005,0.041,0.04]
            transform?.scale = [4.9,1,4.9]
        }
        return transform
    }
    
    static func riseDropSix(sliderVal: Float, entity: Entity?) -> Transform? {
        
        var transform = entity?.transform
        
        switch sliderVal {
        case 0.0..<0.2:
            transform?.translation = [0.098,0.041,0.119]
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
            transform?.translation = [0.166,0.041,0.102]
            transform?.scale = [2.35,1,2.35]
        }
        return transform
    }
    
    static func riseDropSeven(sliderVal: Float, entity: Entity?) -> Transform? {
        
        var transform = entity?.transform
        
        switch sliderVal {
        case 0.0..<0.2:
            transform?.translation = [0.099,0.041,0.176]
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
            transform?.translation = [0.133,0.041,0.155]
            transform?.scale = [2.4,1,2.4]
        }
        return transform
    }
}

