//
//  WavyView.swift
//  Coastlines
//
//  Created by Kelby Mittan on 6/1/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class WavyView: UIView {
    
    public var start: Double = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    override func draw(_ rect: CGRect) {
        UIColor(red: 0, green: 0, blue: 0, alpha: 0).set()
        let bg = UIBezierPath(rect: rect)
        bg.fill()
        
        // Add the first sine wave filled with a very transparent white
        let top1: CGFloat = 17.0
        let wave1 = wavyPath(rect: CGRect(x: 0, y: top1, width: frame.width, height: frame.height - top1), periods: (0.75 * 5), amplitude: 10, start: start)
        //        let wave1 = wavyPath(rect: CGRect(x: 0, y: top1, width: frame.width, height: frame.height - top1), periods: 0.75, amplitude: 20, start: -5)

        let waveColor: UIColor = PaletteColour.lightBlue.colour
        waveColor.set()
        wave1.fill()
        
    }
    
    // This creates the desired sine wave bezier path
    // rect is the area to fill with the sine wave
    // periods is how may sine waves fit across the width of the frame
    // amplitude is the height in points of the sine wave
    // start is an offset in wavelengths for the left side of the sine wave
    func wavyPath(rect: CGRect, periods: Double, amplitude: Double, start: Double) -> UIBezierPath {
        let path = UIBezierPath()
        
        // start in the bottom left corner
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        
        let radsPerPoint = Double(rect.width) / periods / 2.0 / Double.pi
        let radOffset = start * 2 * Double.pi
        let xOffset = Double(rect.minX)
        let yOffset = Double(rect.maxY) - amplitude
        // This loops through the width of the frame and calculates and draws each point along the size wave
        // Adjust the "by" value as needed. A smaller value gives smoother curve but takes longer to draw. A larger value is quicker but gives a rougher curve.
        for x in stride(from: 0, to: Double(rect.width), by: 6) {
            let rad = Double(x) / radsPerPoint + radOffset
            let y = sin(rad) * amplitude
            
            path.addLine(to: CGPoint(x: x + xOffset, y: y + yOffset))
        }
        
        // Add the last point on the sine wave at the right edge
        let rad = Double(rect.width) / radsPerPoint + radOffset
        let y = sin(rad) * amplitude
        
        path.addLine(to: CGPoint(x: Double(rect.maxX), y: y + yOffset))
        
        // Add line from the end of the sine wave to the bottom right corner
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        // Close the path
        path.close()
        
        return path
    }
    
    public func waveIncrease() {
        start += 0.01
        setNeedsDisplay()
    }
    
    public func waveDecrease() {
        start -= 0.01
        setNeedsDisplay()
    }
}
