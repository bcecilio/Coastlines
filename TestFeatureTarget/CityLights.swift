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
    
    static func addLightToImage() -> SpotLight {
        let imageLight = SpotLight()
        imageLight.position = [0,0.6,0.4]
        imageLight.light.attenuationRadius = 0.8
        imageLight.light.color = .red
        imageLight.light.intensity = 70000
        return imageLight
    }
    
    static func addMarkerLights() -> (SpotLight, SpotLight, SpotLight) {
        let bParkLight = SpotLight()
        let sssLight = SpotLight()
        let dumboLight = SpotLight()
        
        bParkLight.position = [-0.2,0.28,0.18]
        bParkLight.light.attenuationRadius = 0.5
        bParkLight.light.color = .white
        bParkLight.light.intensity = 700
        
//        bParkLight.transform.rotation = simd_quatf(vector: [GLKMathDegreesToRadians(0),GLKMathDegreesToRadians(0),GLKMathDegreesToRadians(0), 10])
        
        sssLight.position = [-0.04,0.32,0.25] //[-0.045,0.31,0.2]
        sssLight.light.attenuationRadius = 0.75
        sssLight.light.color = .white
        sssLight.light.intensity = 900
        
//        sssLight.transform.rotation = simd_quatf(vector: [GLKMathDegreesToRadians(0),GLKMathDegreesToRadians(0),GLKMathDegreesToRadians(0), 10])
        
        dumboLight.position = [0.2,0.28,0.27]
        dumboLight.light.attenuationRadius = 0.7
        dumboLight.light.color = .white
        dumboLight.light.intensity = 700
        
        
        return (bParkLight, sssLight, dumboLight)
    }
    
    static func addCityLights() -> (SpotLight, SpotLight, SpotLight, SpotLight, SpotLight) {
        let lightOne = SpotLight()
        let lightTwo = SpotLight()
        let lightThree = SpotLight()
        let lightFour = SpotLight()
        let lightFive = SpotLight()
        
        lightOne.position =  [-0.2635, 0, 0.0704]
        lightOne.light.attenuationRadius = 1.3
        lightOne.light.color = .blue
        lightOne.light.intensity = 700
        
        lightOne.transform.rotation = simd_quatf(vector: [GLKMathDegreesToRadians(-45),GLKMathDegreesToRadians(0),GLKMathDegreesToRadians(90), 10])
        
        lightTwo.position =  [-0.3035, 0, 0.2084] //[-0.2035, 0, 0.1084]
        lightTwo.light.attenuationRadius = 1.3
        lightTwo.light.color = .green
        lightTwo.light.intensity = 700
        lightTwo.transform.rotation = simd_quatf(vector: [GLKMathDegreesToRadians(-50),GLKMathDegreesToRadians(0),GLKMathDegreesToRadians(90), 10])
        
//        let angleX = simd_quatf(angle: GLKMathDegreesToRadians(-70), axis: [1, 0, 0])
//        let angleZ = simd_quatf(angle: GLKMathDegreesToRadians(90), axis: [0, 0, 1])
//        let angle = simd_mul(angleX, angleZ)
//
//        lightTwo.transform.rotation = angle
        
        lightThree.position = [-0.1035, 0, 0.1584]
        lightThree.light.attenuationRadius = 1
        lightThree.light.color = .white
        lightThree.light.intensity = 700
        lightThree.transform.rotation = simd_quatf(vector: [GLKMathDegreesToRadians(-50),GLKMathDegreesToRadians(0),GLKMathDegreesToRadians(90), 10])
        
        lightFour.position =  [0, 0, 0.1084]
        lightFour.light.attenuationRadius = 0.86
        lightFour.light.color = .white
        lightFour.light.intensity = 700
        
        lightFour.transform.rotation = simd_quatf(vector: [GLKMathDegreesToRadians(-130),GLKMathDegreesToRadians(0),GLKMathDegreesToRadians(90), 10])
        
        lightFive.position = [0.098, 0.04, 0.16] //[0.198, 0.040, 0.16]
        lightFive.light.attenuationRadius = 1.3
        lightFive.light.color = .white
        lightFive.light.intensity = 700
        lightFive.transform.rotation = simd_quatf(vector: [GLKMathDegreesToRadians(-260),GLKMathDegreesToRadians(0),GLKMathDegreesToRadians(40), 10])
        
        return (lightOne, lightTwo, lightThree, lightFour, lightFive)
    }
    
    static func addDangerLights() -> (SpotLight, SpotLight) {
        let lightOne = SpotLight()
        let lightTwo = SpotLight()
        
        lightOne.position =  [-0.3035, 0, 0.2084]
        lightOne.light.attenuationRadius = 0.5
        lightOne.light.color = .red
        lightOne.light.intensity = 6000
        
        lightOne.transform.rotation = simd_quatf(vector: [GLKMathDegreesToRadians(-73),GLKMathDegreesToRadians(0),GLKMathDegreesToRadians(90), 10])
        
        lightTwo.position = [0.098, 0.040, 0.16]
        lightTwo.light.attenuationRadius = 0
        lightTwo.light.color = .red
        lightTwo.light.intensity = 6000
        lightTwo.transform.rotation = simd_quatf(vector: [GLKMathDegreesToRadians(-250),GLKMathDegreesToRadians(0),GLKMathDegreesToRadians(40), 10])
        
//        lightOne.position =  [-0.2035, 0, 0.1084]
//
//        lightOne.light.attenuationRadius = 1.3
//        lightOne.light.color = .purple
//        lightOne.light.intensity = 5000
//
//        lightOne.transform.rotation = simd_quatf(vector: [GLKMathDegreesToRadians(-70),GLKMathDegreesToRadians(0),GLKMathDegreesToRadians(90), 10])
        
//        lightTwo.position = [-0.1261, 0.0487, -0.2044]
//        lightTwo.light.attenuationRadius = 0.26
//        lightTwo.light.color = .systemTeal
//        lightTwo.light.innerAngleInDegrees = 180
//        lightTwo.light.outerAngleInDegrees = 0
        
        
        return (lightOne, lightTwo)
    }
    
    
    
    static func movelights(sliderVal: Float, light: SpotLight?) -> Transform? {
        var transform = light?.transform
        //        let angleX = simd_quatf(angle: GLKMathDegreesToRadians(-70), axis: [1, 0, 0])
        //        let angleZ = simd_quatf(angle: GLKMathDegreesToRadians(90), axis: [0, 0, 1])
        //        let angle = simd_mul(angleX, angleZ)
        
        //        transform?.rotation = angle
        switch sliderVal {
        case 0..<0.5:
            //            transform?.rotation = angle
            transform?.translation = [-0.3035, 0, 0.2084]
        case 0.5...:
            //            transform?.rotation = angle
            transform?.translation = [-0.1035, 0, 0.1584]
        default:
            transform?.translation = [0, 0, 0]//[-0.17,0.041,0.02]
            //            transform?.scale = [4,1,4]
        }
        return transform
    }
    
    static func moveCenterCityLight(sliderVal: Float, light: SpotLight) -> SpotLight {
        let newLight = light
        let moveX: Float = 0.0175
        let originalX: Float = -0.3035
        let originalZ: Float = 0.2084
        
        switch sliderVal {
        case 0.0..<0.2:
            newLight.position = [originalX, 0, originalZ]
        case 0.2..<0.3:
            newLight.position = [(originalX)+moveX, 0, originalZ-moveX]
        case 0.3..<0.4:
            newLight.position = [(originalX)+(moveX*2), 0, originalZ-(moveX*2)]
        case 0.4..<0.5:
            newLight.position = [(originalX)+(moveX*3), 0, originalZ-(moveX*3)]
        case 0.5..<0.6:
            newLight.position = [(originalX)+(moveX*4), 0, originalZ-(moveX*4)]
        case 0.6..<0.7:
            newLight.position = [(originalX)+(moveX*5), 0, originalZ-(moveX*5)]
        case 0.7..<0.8:
            newLight.position = [(originalX)+(moveX*6), 0, originalZ-(moveX*6)]
        case 0.8..<0.9:
            newLight.position = [(originalX)+(moveX*7), 0, originalZ-(moveX*7)]
        default:
            newLight.position = [(originalX)+(moveX*8), 0, originalZ-(moveX*8)]
        }
        return newLight
    }
    
    static func moveRightCityLight(sliderVal: Float, light: SpotLight) -> SpotLight {
        let newLight = light
        let moveX: Float = 0.016
        let moveZ: Float = 0.009
        let originalX: Float = -0.1035
        let originalZ: Float = 0.1584
        // [-0.1035, 0, 0.1584] //   [-0.035,0,0.08]
        
        switch sliderVal {
        case 0.0..<0.5:
            newLight.position = [originalX, 0, originalZ]
        case 0.5..<0.6:
            newLight.position = [(originalX)+moveX, 0, originalZ-moveZ]
        case 0.6..<0.7:
            newLight.position = [(originalX)+(moveX*2), 0, originalZ-(moveZ*2)]
        case 0.7..<0.8:
            newLight.position = [(originalX)+(moveX*3), 0, originalZ-(moveZ*3)]
        case 0.8..<0.9:
            newLight.position = [(originalX)+(moveX*4), 0, originalZ-(moveZ*4)]
        default:
            newLight.position = [(originalX)+(moveX*5), 0, originalZ-(moveZ*5)]
        }
        return newLight
    }
    
    static func highlightManhattan(sliderVal: Float, light: SpotLight) -> SpotLight {
        let newLight = light
        let attenuation: Float = 0.0625
        
        switch sliderVal {
        case 0.0..<0.2:
            newLight.light.attenuationRadius = 0
        case 0.2..<0.3:
            newLight.light.attenuationRadius = attenuation*2.5
        case 0.3..<0.4:
            newLight.light.attenuationRadius = attenuation*3.5
        case 0.4..<0.5:
            newLight.light.attenuationRadius = attenuation*4.2
        case 0.5..<0.6:
            newLight.light.attenuationRadius = attenuation*4.6
        case 0.6..<0.7:
            newLight.light.attenuationRadius = attenuation*5.5
        case 0.7..<0.8:
            newLight.light.attenuationRadius = attenuation*6
        default:
            newLight.light.attenuationRadius = attenuation*7
        }
        return newLight
    }
    
    static func moveBKLight(sliderVal: Float, light: SpotLight) -> SpotLight {
        let newLight = light
        
        let moveY: Float = 0.008
        
        let originalX: Float = 0.098
        let originalY: Float = 0.04
        let originalZ: Float = 0.16
        // [0.098, 0.040, 0.16]
        
        switch sliderVal {
        case 0.0..<0.5:
            newLight.position = [originalX, originalY, originalZ]
        case 0.5..<0.6:
            newLight.position = [originalX, originalY-moveY, originalZ]
        case 0.6..<0.7:
            newLight.position = [originalX, originalY-(moveY*2), originalZ]
        case 0.7..<0.8:
            newLight.position = [originalX, originalY-(moveY*3), originalZ]
        case 0.8..<0.9:
            newLight.position = [originalX, originalY-(moveY*4), originalZ]
        default:
            newLight.position = [originalX, originalY-(moveY*5), originalZ]
        }
        return newLight
    }
    
    static func highlightBrooklyn(sliderVal: Float, light: SpotLight) -> SpotLight {
        let newLight = light
        let attenuation: Float = 0.0225

        switch sliderVal {
        case 0.0..<0.2:
            newLight.light.attenuationRadius = 0
        case 0.2..<0.6:
            newLight.light.attenuationRadius = attenuation*4.6
        case 0.6..<0.7:
            newLight.light.attenuationRadius = attenuation*5.5
        case 0.7..<0.8:
            newLight.light.attenuationRadius = attenuation*6
        default:
            newLight.light.attenuationRadius = attenuation*7
        }
        return newLight
    }
}





