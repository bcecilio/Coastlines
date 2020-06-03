//
//  String+HexConversion.swift
//  Coastlines
//
//  Created by Cameron Rivera on 6/2/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

extension String {
    
    func convertHexToColour() -> UIColor {
        guard self.count == 7 else { return UIColor.black }
        var hexTuple: (Int,Int,Int) = (0,0,0)
        hexTuple.0 = Int(self[self.index(self.startIndex, offsetBy: 1)...self.index(self.startIndex, offsetBy: 2)], radix: 16) ?? 0
        hexTuple.1 = Int(self[self.index(self.startIndex, offsetBy: 3)...self.index(self.startIndex, offsetBy: 4)], radix: 16) ?? 0
        hexTuple.2 = Int(self[self.index(self.startIndex, offsetBy: 5)...self.index(self.startIndex, offsetBy: 6)], radix: 16) ?? 0
        return UIColor(red: CGFloat(hexTuple.0) / 255.0, green: CGFloat(hexTuple.1) / 255.0, blue: CGFloat(hexTuple.2) / 255.0, alpha: 1.0)
    }
    
}
