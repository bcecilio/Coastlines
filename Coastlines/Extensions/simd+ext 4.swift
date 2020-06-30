//
//  simd+ext.swift
//  Coastlines
//

//  Created by Kaz Yoshikawa on 11/6/15.
  /////Created by Kelby Mittan on 6/18/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import Foundation
import simd
import GLKit

extension float4x4 {

    static func makeScale(x: Float, _ y: Float, _ z: Float) -> float4x4 {
        return unsafeBitCast(GLKMatrix4MakeScale(x, y, z), to: float4x4.self)
    }

    static func makeRotate(radians: Float, _ x: Float, _ y: Float, _ z: Float) -> float4x4 {
        return unsafeBitCast(GLKMatrix4MakeRotation(radians, x, y, z), to: float4x4.self)
    }

    static func makeTranslation(x: Float, _ y: Float, _ z: Float) -> float4x4 {
        return unsafeBitCast(GLKMatrix4MakeTranslation(x, y, z), to: float4x4.self)
    }

    static func makePerspective(fovyRadians: Float, _ aspect: Float, _ nearZ: Float, _ farZ: Float) -> float4x4 {
        return unsafeBitCast(GLKMatrix4MakePerspective(fovyRadians, aspect, nearZ, farZ), to: float4x4.self)
    }

    static func makeFrustum(left: Float, _ right: Float, _ bottom: Float, _ top: Float, _ nearZ: Float, _ farZ: Float) -> float4x4 {
        return unsafeBitCast(GLKMatrix4MakeFrustum(left, right, bottom, top, nearZ, farZ), to: float4x4.self)
    }

    static func makeOrtho(left: Float, _ right: Float, _ bottom: Float, _ top: Float, _ nearZ: Float, _ farZ: Float) -> float4x4 {
        return unsafeBitCast(GLKMatrix4MakeOrtho(left, right, bottom, top, nearZ, farZ), to: float4x4.self)
    }

    static func makeLookAt(eyeX: Float, _ eyeY: Float, _ eyeZ: Float, _ centerX: Float, _ centerY: Float, _ centerZ: Float, _ upX: Float, _ upY: Float, _ upZ: Float) -> float4x4 {
        return unsafeBitCast(GLKMatrix4MakeLookAt(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ), to: float4x4.self)
    }


    func scale(x: Float, y: Float, z: Float) -> float4x4 {
        return self * float4x4.makeScale(x: x, y, z)
    }

    func rotate(radians: Float, _ x: Float, _ y: Float, _ z: Float) -> float4x4 {
        return self * float4x4.makeRotate(radians: radians, x, y, z)
    }

    func translate(x: Float, _ y: Float, _ z: Float) -> float4x4 {
        return self * float4x4.makeTranslation(x: x, y, z)
    }

}
