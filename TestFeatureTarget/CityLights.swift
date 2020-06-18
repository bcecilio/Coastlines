//
//  CityLights.swift
//  TestFeatureTarget
//
//  Created by Kelby Mittan on 6/17/20.
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
        lightOne.light.color = .systemGreen
        lightOne.light.intensity = 700
        
        lightOne.transform.rotation = simd_quatf(vector: [GLKMathDegreesToRadians(-45),GLKMathDegreesToRadians(0),GLKMathDegreesToRadians(90), 10])
        
        lightTwo.position =  [-0.2035, 0, 0.1084]
        lightTwo.light.attenuationRadius = 1.3
        lightTwo.light.color = .purple
        lightTwo.light.intensity = 700
        
        lightTwo.transform.rotation = simd_quatf(vector: [GLKMathDegreesToRadians(-70),GLKMathDegreesToRadians(0),GLKMathDegreesToRadians(90), 10])
        
        lightThree.position = [-0.1035, 0, 0.1584]
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
}
