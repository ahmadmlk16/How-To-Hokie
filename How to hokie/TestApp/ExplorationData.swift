//
//  ExplorationData.swift
//  TestApp
//
//  Created by Alex Cann on 11/19/19.
//  Copyright © 2019 Alex Cann. All rights reserved.
//

import Foundation
import SwiftUI
 
// Global array of Exploration structs
var explorationStructList = [Exploration]()
 
/*
 ******************************
 MARK: - Read Exploration Data File
 ******************************
 */
public func readExplorationDataFile() {
   
    let ExplorationDataFilename = "ArrayOfExploration.json"
   
    // Obtain URL of the Exploration data file in document directory on user's device
    let urlOfJsonFileInDocumentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(ExplorationDataFilename)
 
    do {
        _ = try Data(contentsOf: urlOfJsonFileInDocumentDirectory)
       
        // Exploration data file exists in the document directory
 
        explorationStructList = loadFromDocumentDirectory(ExplorationDataFilename)
        print("ExplorationData is loaded from document directory")
       
    } catch {
        // Exploration data file does not exist in the document directory; Load it from the main bundle.
       
        explorationStructList = loadFromMainBundle(ExplorationDataFilename)
        print("ExplorationData is loaded from main bundle")
    }
}
 
/*
 *****************************************************
 MARK: - Write Exploration Data File to Document Directory
 *****************************************************
 */
public func writeExplorationDataFile() {
 
    // Obtain URL of the file in document directory on user's device
    // into which Exploration data will be written
    let urlOfJsonFileInDocumentDirectory: URL? = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("ExplorationData.json")
 
    let encoder = JSONEncoder()
    if let encoded = try? encoder.encode(explorationStructList) {
        do {
            try encoded.write(to: urlOfJsonFileInDocumentDirectory!)
        } catch {
            fatalError("Unable to write encoded Exploration data to document directory!")
        }
    } else {
        fatalError("Unable to encode Exploration data!")
    }
}
 


