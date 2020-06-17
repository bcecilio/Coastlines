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
        let redLightManh = SpotLight()
        let whiteLightOne = SpotLight()
        let redLightBrook = SpotLight()
        let whiteLightBrook = SpotLight()
        
        redLightManh.position =  [-0.3035, 0, 0.2084]
        redLightManh.light.attenuationRadius = 1.3
        redLightManh.light.color = .purple
        redLightManh.light.intensity = 10000
        
        redLightManh.transform.rotation = simd_quatf(vector: [GLKMathDegreesToRadians(-70),GLKMathDegreesToRadians(0),GLKMathDegreesToRadians(90), 10])
        
        whiteLightOne.position = [-0.1261, 0.0487, -0.2044]
        whiteLightOne.light.attenuationRadius = 0.26
        whiteLightOne.light.color = .systemTeal
        whiteLightOne.light.innerAngleInDegrees = 180
        whiteLightOne.light.outerAngleInDegrees = 0
        
        redLightBrook.position = [0.1644, 0.0487, 0.2044]
        redLightBrook.light.attenuationRadius = 0.16
        redLightBrook.light.color = .green
        redLightBrook.light.outerAngleInDegrees = 135
        return (redLightManh, whiteLightOne, redLightBrook, whiteLightBrook)
    }
}
