//
//  LocationDetailController+ConfigureCells.swift
//  Coastlines
//
//  Created by Cameron Rivera on 7/9/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit
import Charts

extension LocationDetailController {
    
    /**
        Configures  and returns a TOCCell, a subclass of UICollectionViewCell
        - Parameters:
            - collectionView: A collectionView from which to dequeue a reusable cell.
            - indexPath: The indexPath of the collection view.
            - viewController: A viewController that conforms to the TapContents protocol.
     */
    func configureTOCCell<T: TapContents & UIViewController>(_ collectionView: UICollectionView, _ indexPath: IndexPath, _ viewController: T) -> TOCCell {
        guard let tocCell = collectionView.dequeueReusableCell(withReuseIdentifier: "tocCell", for: indexPath) as? TOCCell else {
            fatalError("Could not dequeue TOCCell")
        }
        tocCell.contentDelegate = viewController
        return tocCell
    }
    
    /**
        Configures and returns a ContentCell, a subclass of UICollectionViewCell
        - Parameters:
            - collectionView: A collectionView from which to dequeue a reusable cell.
            - indexPath: The indexPath of the collection view.
            - cellText: Text used to populate the contents of the content cell. There should be at least four elements in the array. The 0th element will be assigned to the headerLabel, the 1st element will be assigned to factOneLabel, the 2nd element will be assigned to the factTwoLabel, and the 3rd element will be assigned to the contentLabel. Any further elements will be unused. 
     */
    func configureContentCell(_ collectionView: UICollectionView, _ indexPath: IndexPath, _ cellText: [String]) -> ContentCell {
        guard let contentCell = collectionView.dequeueReusableCell(withReuseIdentifier: "contentCell", for: indexPath) as? ContentCell, cellText.count > 3 else {
            fatalError("Error creating content cell.")
        }
        
        contentCell.headerLabel.text = cellText[0]
        contentCell.factOneLabel.text = cellText[1]
        contentCell.factTwoLabel.text = cellText[2]
        contentCell.contentLabel.text = cellText[3]
        
        contentCell.headerLabel.addAccessibility(.none, cellText[0], nil, nil)
        contentCell.factOneLabel.addAccessibility(.none, cellText[1], nil, nil)
        contentCell.factTwoLabel.addAccessibility(.none, cellText[2], nil, nil)
        contentCell.contentLabel.addAccessibility(.none, cellText[3], nil, nil)
        
        return contentCell
    }
    
    /**
        Configures and returns a Graph Cell, a subclass of UICollectionViewCell
        - Parameters:
            - collectionView: A collectionView from which to dequeue a reusable cell.
            - indexPath: The indexPath of the collectionView.
            - viewController: A view controller that conforms to the GraphClicked protocol.
            - loc: Location information. Used to set up the information contained within Lina.
     */
    func configureLina<T: GraphClicked & UIViewController>(_ collectionView: UICollectionView, _ indexPath: IndexPath, _ viewController: T,_ loc: Location) -> GraphCell {
        guard let graphCell = collectionView.dequeueReusableCell(withReuseIdentifier: "graphCell", for: indexPath) as? GraphCell else {
            fatalError("Could not dequeue UICollectionViewCell as a graph cell.")
        }
        graphCell.location = loc
        graphCell.setSeaLevelData()
        graphCell.seaLevelSet.setCircleColor(PaletteColour.darkBlue.colour)
        graphCell.seaLevelSet.setColor(PaletteColour.darkBlue.colour)
        graphCell.seaLevelSet.fill = Fill(color: PaletteColour.darkBlue.colour)
        graphCell.graphDelegate = viewController
        return graphCell
    }
    
    /**
        Configures, and returns a PieChartCell, a subclass of UICollectionViewCell
        - Parameters:
            - collectionView: A collectionView from which to dequeue a reusable cell.
            - indexPath: The indexPath of the collectionView.
            - loc: Location information. Used to set up the information contained within the pie chart.
     */
    func configurePieChartCell(_ collectionView: UICollectionView, _ indexPath: IndexPath, _ loc: Location) -> PieChartCell {
        guard let pcCell = collectionView.dequeueReusableCell(withReuseIdentifier: "pieCell", for: indexPath) as? PieChartCell else  {
            fatalError("Could not dequeue UICollectionViewCell as a pieChartCell.")
        }
        pcCell.location = loc
        pcCell.setPopulationGraphData()
        return pcCell
    }
    
}
