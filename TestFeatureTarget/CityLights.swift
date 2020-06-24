//
//  CityLight.swift
//  TestFeatureTarget
//
//  Created by Ahad Islam on 6/18/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import ARKit
import RealityKit

struct CityLights {
    
    static func addSpotlights() -> (SpotLight, SpotLight, SpotLight, SpotLight) {
        let lightOne = SpotLight()
        let lightTwo = SpotLight()
        let lightThree = SpotLight()
        let lightFour = SpotLight()
        
        lightOne.position =  [-0.2035, 0, 0.1084]
        
        lightOne.light.attenuationRadius = 1.3
        lightOne.light.color = .purple
        lightOne.light.intensity = 5000
        
        lightOne.transform.rotation = simd_quatf(vector: [GLKMathDegreesToRadians(-70),GLKMathDegreesToRadians(0),GLKMathDegreesToRadians(90), 10])
        
        lightTwo.position = [-0.1261, 0.0487, -0.2044]
        lightTwo.light.attenuationRadius = 0.26
        lightTwo.light.color = .systemTeal
        lightTwo.light.innerAngleInDegrees = 180
        lightTwo.light.outerAngleInDegrees = 0
        
        lightThree.position = [0.098, 0.040, 0.16]
        lightThree.light.attenuationRadius = 1.3
        lightThree.light.color = .red
        lightThree.light.intensity = 5000
        lightThree.transform.rotation = simd_quatf(vector: [GLKMathDegreesToRadians(-240),GLKMathDegreesToRadians(0),GLKMathDegreesToRadians(40), 10])
        
        lightFour.position =  [-0.3035, 0, 0.2084]
        lightFour.light.attenuationRadius = 0.27
        lightFour.light.color = .red
        lightFour.light.intensity = 5000
        
        lightFour.transform.rotation = simd_quatf(vector: [GLKMathDegreesToRadians(-70),GLKMathDegreesToRadians(0),GLKMathDegreesToRadians(90), 10])
        
        return (lightOne, lightTwo, lightThree, lightFour)
    }
    
    static func addCityLights() -> (SpotLight, SpotLight, SpotLight, SpotLight) {
        let lightOne = SpotLight()
        let lightTwo = SpotLight()
        let lightThree = SpotLight()
        let lightFour = SpotLight()
        
        lightOne.position =  [-0.2635, 0, 0.0704]
        lightOne.light.attenuationRadius = 1.3
        lightOne.light.color = .blue
        lightOne.light.intensity = 700
        
        lightOne.transform.rotation = simd_quatf(vector: [GLKMathDegreesToRadians(-45),GLKMathDegreesToRadians(0),GLKMathDegreesToRadians(90), 10])
        
        lightTwo.position =  [-0.3035, 0, 0.2084] //[-0.2035, 0, 0.1084]
        lightTwo.light.attenuationRadius = 1.3
        lightTwo.light.color = .green
        lightTwo.light.intensity = 700
        
        lightTwo.transform.rotation = simd_quatf(vector: [GLKMathDegreesToRadians(-70),GLKMathDegreesToRadians(0),GLKMathDegreesToRadians(90), 10])
        
        lightThree.position = [-0.035,0,0.08]// [-0.1035, 0, 0.1584]
        lightThree.light.attenuationRadius = 1.3
        lightThree.light.color = .yellow
        lightThree.light.intensity = 700
        lightThree.transform.rotation = simd_quatf(vector: [GLKMathDegreesToRadians(-80),GLKMathDegreesToRadians(0),GLKMathDegreesToRadians(90), 10])
        
        lightFour.position =  [0, 0, 0.1084]
        lightFour.light.attenuationRadius = 0.26
        lightFour.light.color = .red
        lightFour.light.intensity = 700
        
        lightFour.transform.rotation = simd_quatf(vector: [GLKMathDegreesToRadians(-130),GLKMathDegreesToRadians(0),GLKMathDegreesToRadians(90), 10])
        
        return (lightOne, lightTwo, lightThree, lightFour)
    }
    
    static func movelights(sliderVal: Float, light: SpotLight?) -> Transform? {
        var transform = light?.transform
        let angle = simd_quatf(vector: [GLKMathDegreesToRadians(-70),GLKMathDegreesToRadians(0),GLKMathDegreesToRadians(90), 10])
        
        switch sliderVal {
//        case 0.0..<0.2:
//            transform?.translation = [-0.3035, 0, 0.2084]
////            transform?.translation = [-0.25,0.041,0.14]
////            transform?.scale = [1,1,1]
//            break
//        case 0.2..<0.3:
////            transform?.translation = [-0.2035, 0, 0.1084]//[-0.24,0.041,0.125]
////            transform?.scale = [1.375,1,1.375]
//            break
//        case 0.3..<0.4:
////            transform?.translation = [-0.2035, 0, 0.1084]//[-0.23,0.041,0.11]
////            transform?.scale = [1.75,1,1.75]
//            break
//        case 0.4..<0.5:
////            transform?.translation = [-0.2035, 0, 0.1084]//[-0.22,0.041,0.095]
////            transform?.scale = [2.125,1,2.125]
//            break
//        case 0.5..<0.6:
////            transform?.translation = [-0.2035, 0, 0.1084]//[-0.21,0.041,0.08]
////            transform?.scale = [2.5,1,2.5]
//            break
//        case 0.6..<0.7:
////            transform?.translation = [-0.2035, 0, 0.1084]//[-0.20,0.041,0.065]
////            transform?.scale = [2.875,1,2.875]
//            break
//        case 0.7..<0.8:
////            transform?.translation = [-0.2035, 0, 0.1084]//[-0.19,0.041,0.05]
////            transform?.scale = [3.25,1,3.25]
//            break
//        case 0.8..<0.9:
//            transform?.translation = [-0.2035, 0, 0.1084]//[-0.18,0.041,0.035]
////            transform?.scale = [3.625,1,3.625]
//            break
            
        case 0..<0.5:
            transform?.rotation = angle
            transform?.translation = [-0.3035, 0, 0.2084]
        case 0.5...:
            transform?.rotation = angle
            transform?.translation = [-0.2035, 0, 0.1084]
        default:
            transform?.translation = [0, 0, 0]//[-0.17,0.041,0.02]
//            transform?.scale = [4,1,4]
        }
        return transform
    }
    
    static func moveCenterCityLight(sliderVal: Float, light: SpotLight, oldVal: Float) -> SpotLight {
        let newLight = light
        let moveX: Float = 0.0175
//        var direction: Float = 1
//
//        if oldVal > sliderVal {
//            direction = -1
//        } else if oldVal == sliderVal {
//            direction = 0
//        } else {
//            direction = 1
//        }
        
//        [-0.3035, 0, 0.2084] [-0.2035, 0, 0.2084]
        
        
        
        switch sliderVal {
        case 0.0..<0.2:
//            newLight.position.x += 0
//            newLight.position.z -= 0
            newLight.position = [-0.3035, 0, 0.2084]
        case 0.2..<0.3:
//            newLight.position.x += moveX*direction
//            newLight.position.z -= moveX*direction
            newLight.position = [(-0.3035)+moveX, 0, 0.2084-moveX]
        case 0.3..<0.4:
//            newLight.position.x += moveX*2*direction
//            newLight.position.z -= moveX*2*direction
            newLight.position = [(-0.3035)+(moveX*2), 0, 0.2084-(moveX*2)]
        case 0.4..<0.5:
//            newLight.position.x += moveX*3*direction
//            newLight.position.z -= moveX*3*direction
            newLight.position = [(-0.3035)+(moveX*3), 0, 0.2084-(moveX*3)]
        case 0.5..<0.6:
//            newLight.position.x += moveX*4*direction
//            newLight.position.z -= moveX*4*direction
            newLight.position = [(-0.3035)+(moveX*4), 0, 0.2084-(moveX*4)]
        case 0.6..<0.7:
//            newLight.position.x += moveX*5*direction
//            newLight.position.z -= moveX*5*direction
            newLight.position = [(-0.3035)+(moveX*5), 0, 0.2084-(moveX*5)]
        case 0.7..<0.8:
//            newLight.position.x += moveX*6*direction
//            newLight.position.z -= moveX*6*direction
            newLight.position = [(-0.3035)+(moveX*6), 0, 0.2084-(moveX*6)]
        case 0.8..<0.9:
//            newLight.position.x += moveX*7*direction
//            newLight.position.z -= moveX*7*direction
            newLight.position = [(-0.3035)+(moveX*7), 0, 0.2084-(moveX*7)]
        default:
//            newLight.position.x += moveX*8*direction
//            newLight.position.z -= moveX*8*direction
            newLight.position = [(-0.3035)+(moveX*8), 0, 0.2084-(moveX*8)]
        }
        return newLight
    }
    
    static func moveRightCityLight(sliderVal: Float, light: SpotLight) -> SpotLight {
            let newLight = light
            let moveX: Float = 0.086
        let moveZ: Float = 0.009
        
     // [-0.1035, 0, 0.1584] //   [-0.035,0,0.08]
        
            switch sliderVal {
            case 0.0..<0.2:
                newLight.position = [-0.1035, 0, 0.1584]
            case 0.2..<0.3:
                newLight.position = [(-0.1035)+moveX, 0, 0.2084-moveZ]
            case 0.3..<0.4:
                newLight.position = [(-0.3035)+(moveX*2), 0, 0.2084-(moveZ*2)]
            case 0.4..<0.5:
                newLight.position = [(-0.3035)+(moveX*3), 0, 0.2084-(moveZ*3)]
            case 0.5..<0.6:
                newLight.position = [(-0.3035)+(moveX*4), 0, 0.2084-(moveZ*4)]
            case 0.6..<0.7:
                newLight.position = [(-0.3035)+(moveX*5), 0, 0.2084-(moveZ*5)]
            case 0.7..<0.8:
                newLight.position = [(-0.3035)+(moveX*6), 0, 0.2084-(moveZ*6)]
            case 0.8..<0.9:
                newLight.position = [(-0.3035)+(moveX*7), 0, 0.2084-(moveZ*7)]
            default:
                newLight.position = [(-0.3035)+(moveX*8), 0, 0.2084-(moveZ*8)]
            }
            return newLight
        }
}





