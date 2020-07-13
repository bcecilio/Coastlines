//
//  UICollectionView+configureCellSize.swift
//  Coastlines
//
//  Created by Cameron Rivera on 7/9/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    /**
     Configures the size of the cells in a collectionView.
     
     - Parameters:
        - numberOfItems: Represents the number of cells to be displayed on the screen.
        - spacingBetweenItems: Represents the amount of space between each cell.
     */
    
    func configureCellSize(_ numberOfItems: CGFloat, _ spacingBetweenItems: CGFloat) -> CGSize {
        let maxSize: CGSize = UIScreen.main.bounds.size
        let totalSpacing: CGFloat = (2 * spacingBetweenItems) + (numberOfItems - 1) * spacingBetweenItems
        let itemWidth: CGFloat = (maxSize.width - totalSpacing) / numberOfItems
        let itemHeight: CGFloat = self.frame.height // 1.5
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
}
