//
//  WavyView2.swift
//  Coastlines
//
//  Created by Ahad Islam on 6/3/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class WavyView2: UIView {
    
    public var start: Double = 0.5
    public var amplitude: Double = 16
    public var periods: Double = 0.75

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        // color at the top of the curve
        PaletteColour.darkBlue.colour.set()
        let bg = UIBezierPath(rect: rect)
        bg.fill()
        
        let top: CGFloat = 17.0
        let wave1 = wavyPath(rect: CGRect(x: 0, y: top, width: frame.width, height: frame.height - top), periods: periods, amplitude: amplitude, start: start)
        
        // color at the bottom of the curve.
        let clear: UIColor = PaletteColour.offWhite.colour
        clear.set()
        wave1.fill()
    }
    
    func wavyPath(rect: CGRect, periods: Double, amplitude: Double, start: Double) -> UIBezierPath {
        
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.maxX))
        
        let radsPerPoint = Double(rect.width) / periods / 2.0 / Double.pi
        
        let radOffset = start * 2 * Double.pi
        
        let xOffset = Double(rect.minX)
        let yOffset = Double(rect.maxY) - amplitude
        
        for x in stride(from: 0, to: Double(rect.width), by: 6) {
            let rad = Double(x) / radsPerPoint + radOffset
            let y = sin(rad) * amplitude
            
            path.addLine(to: CGPoint(x: x + xOffset, y: y + yOffset))
        }
        
        let rad = Double(rect.width) / radsPerPoint + radOffset
        let y = sin(rad) * amplitude
        
        path.addLine(to: CGPoint(x: Double(rect.maxX), y: y + yOffset))
        
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        
        path.close()
        return path
    }
    
    ///
    public func waveIncrease() {
        start += 0.01
        setNeedsDisplay()
    }
    
    public func waveDecrease() {
        start -= 0.01
        setNeedsDisplay()
    }

}
