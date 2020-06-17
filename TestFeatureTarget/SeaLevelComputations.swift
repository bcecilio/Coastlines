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
            transform?.translation = [-0.297,0.041,-0.029]
            transform?.scale = [1.375,1,1.375]
        case 0.3..<0.4:
            transform?.translation = [-0.286,0.041,-0.038]
            transform?.scale = [1.75,1,1.75]
        case 0.4..<0.5:
            transform?.translation = [-0.274,0.041,-0.046]
            transform?.scale = [2.125,1,2.125]
        case 0.5..<0.6:
            transform?.translation = [-0.262,0.041,-0.055]
            transform?.scale = [2.5,1,2.5]
        case 0.6..<0.7:
            transform?.translation = [-0.249,0.041,-0.064]
            transform?.scale = [2.875,1,2.875]
        case 0.7..<0.8:
            transform?.translation = [-0.237,0.041,-0.073]
            transform?.scale = [3.25,1,3.25]
        case 0.8..<0.9:
            transform?.translation = [-0.225,0.041,-0.081]
            transform?.scale = [3.625,1,3.625]
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
            transform?.translation = [-0.301,0.041,0.04]
            transform?.scale = [1.25,1,1.25]
        case 0.3..<0.4:
            transform?.translation = [-0.293,0.041,0.03]
            transform?.scale = [1.5,1,1.5]
        case 0.4..<0.5:
            transform?.translation = [-0.284,0.041,0.02]
            transform?.scale = [1.75,1,1.75]
        case 0.5..<0.6:
            transform?.translation = [-0.275,0.041,0.01]
            transform?.scale = [2,1,2]
        case 0.6..<0.7:
            transform?.translation = [-0.266,0.041,0]
            transform?.scale = [2.25,1,2.25]
        case 0.7..<0.8:
            transform?.translation = [-0.258,0.041,-0.01]
            transform?.scale = [2.5,1,2.5]
        case 0.8..<0.9:
            transform?.translation = [-0.249,0.041,-0.02]
            transform?.scale = [2.75,1,2.75]
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
            transform?.translation = [-0.24,0.041,0.125]
            transform?.scale = [1.375,1,1.375]
        case 0.3..<0.4:
            transform?.translation = [-0.23,0.041,0.11]
            transform?.scale = [1.75,1,1.75]
        case 0.4..<0.5:
            transform?.translation = [-0.22,0.041,0.095]
            transform?.scale = [2.125,1,2.125]
        case 0.5..<0.6:
            transform?.translation = [-0.21,0.041,0.08]
            transform?.scale = [2.5,1,2.5]
        case 0.6..<0.7:
            transform?.translation = [-0.20,0.041,0.065]
            transform?.scale = [2.875,1,2.875]
        case 0.7..<0.8:
            transform?.translation = [-0.19,0.041,0.05]
            transform?.scale = [3.25,1,3.25]
        case 0.8..<0.9:
            transform?.translation = [-0.18,0.041,0.035]
            transform?.scale = [3.625,1,3.625]
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
            transform?.translation = [-0.158,0.041,0.16]
            transform?.scale = [1.281,1,1.281]
        case 0.3..<0.4:
            transform?.translation = [-0.156,0.041,0.15]
            transform?.scale = [1.563,1,1.563]
        case 0.4..<0.5:
            transform?.translation = [-0.154,0.041,0.14]
            transform?.scale = [1.844,1,1.844]
        case 0.5..<0.6:
            transform?.translation = [-0.153,0.041,0.13]
            transform?.scale = [2.125,1,2.125]
        case 0.6..<0.7:
            transform?.translation = [-0.151,0.041,0.12]
            transform?.scale = [2.406,1,2.406]
        case 0.7..<0.8:
            transform?.translation = [-0.149,0.041,0.11]
            transform?.scale = [2.688,1,2.688]
        case 0.8..<0.9:
            transform?.translation = [-0.147,0.041,0.1]
            transform?.scale = [2.969,1,2.969]
        default:
            transform?.translation = [-0.145,0.041,0.09]
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
            transform?.translation = [-0.088,0.041,0.141]
            transform?.scale = [1.488,1,1.488]
        case 0.3..<0.4:
            transform?.translation = [-0.076,0.041,0.126]
            transform?.scale = [1.975,1,1.975]
        case 0.4..<0.5:
            transform?.translation = [-0.064,0.041,0.112]
            transform?.scale = [2.463,1,2.463]
        case 0.5..<0.6:
            transform?.translation = [-0.053,0.041,0.098]
            transform?.scale = [2.95,1,2.95]
        case 0.6..<0.7:
            transform?.translation = [-0.041,0.041,0.083]
            transform?.scale = [3.438,1,3.438]
        case 0.7..<0.8:
            transform?.translation = [-0.029,0.041,0.069]
            transform?.scale = [3.925,1,3.925]
        case 0.8..<0.9:
            transform?.translation = [-0.017,0.041,0.054]
            transform?.scale = [4.413,1,4.413]
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
            transform?.translation = [0.107,0.041,0.117]
            transform?.scale = [1.169,1,1.169]
        case 0.3..<0.4:
            transform?.translation = [0.115,0.041,0.115]
            transform?.scale = [1.338,1,1.338]
        case 0.4..<0.5:
            transform?.translation = [0.124,0.041,0.113]
            transform?.scale = [1.506,1,1.506]
        case 0.5..<0.6:
            transform?.translation = [0.132,0.041,0.111]
            transform?.scale = [1.675,1,1.675]
        case 0.6..<0.7:
            transform?.translation = [0.141,0.041,0.108]
            transform?.scale = [1.844,1,1.844]
        case 0.7..<0.8:
            transform?.translation = [0.149,0.041,0.106]
            transform?.scale = [2.013,1,2.013]
        case 0.8..<0.9:
            transform?.translation = [0.158,0.041,0.104]
            transform?.scale = [2.181,1,2.181]
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
            transform?.translation = [0.103,0.041,0.173]
            transform?.scale = [1.175,1,1.175]
        case 0.3..<0.4:
            transform?.translation = [0.108,0.041,0.171]
            transform?.scale = [1.35,1,1.35]
        case 0.4..<0.5:
            transform?.translation = [0.112,0.041,0.168]
            transform?.scale = [1.525,1,1.525]
        case 0.5..<0.6:
            transform?.translation = [0.116,0.041,0.166]
            transform?.scale = [1.7,1,1.7]
        case 0.6..<0.7:
            transform?.translation = [0.120,0.041,0.163]
            transform?.scale = [1.875,1,1.875]
        case 0.7..<0.8:
            transform?.translation = [0.125,0.041,0.160]
            transform?.scale = [2.05,1,2.05]
        case 0.8..<0.9:
            transform?.translation = [0.129,0.041,0.158]
            transform?.scale = [2.225,1,2.225]
        default:
            transform?.translation = [0.133,0.041,0.155]
            transform?.scale = [2.4,1,2.4]
        }
        return transform
    }
}

