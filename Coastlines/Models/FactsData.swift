//
//  FactsData.swift
//  Coastlines
//
//  Created by Kelby Mittan on 5/30/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import Foundation

struct FactsData: Decodable {
    let results: [Location]
}

struct Location: Decodable {
    let name: String
    let images: LocationImages
    let facts: Facts
    let dataSet: [LocationData]
    
    func getDidYouKnowText() -> [String] {
        return [ContentText.didYouKnow, facts.quickFact1, facts.quickFact2, facts.generalFacts]
    }
    
    func getWhatsHappeningText() -> [String] {
        return [ContentText.whatsHappening,facts.quickFact3,facts.quickFact4,facts.seaLevelFacts]
    }
    
    func getWhereWillWeGoText() -> [String] {
        return [ContentText.whereWillWeGo, facts.quickFact5, facts.quickFact6, facts.populationFacts]
    }
}

struct LocationImages: Decodable {
    let one: String
    let two: String
    let three: String
    let four: String
    let five: String
    let six: String
    let seven: String
}

struct Facts: Decodable {
    let quickFact1: String
    let quickFact2: String
    let quickFact3: String
    let quickFact4: String
    let quickFact5: String
    let quickFact6: String
    let generalFacts: String
    let seaLevelFacts: String
    let populationFacts: String
    let population: Int
    let populationDisplaced: Int
}

struct DataSet: Decodable {
    let data: LocationData
}

struct LocationData: Decodable {
    let year: Int
    let level: Double
}

extension FactsData {
    
  static func getLocations() -> [Location] {
    var locations = [Location]()
    
    guard let fileURL = Bundle.main.url(forResource: "locationFactsData", withExtension: "json") else {
      fatalError("error getting json file")
    }
    do {
      let data = try Data(contentsOf: fileURL)
            
      let locationsData = try JSONDecoder().decode(FactsData.self, from: data)
      locations = locationsData.results
      
    } catch {
      fatalError("could not get locations: \(error)")
    }
    return locations
  }
  
}
