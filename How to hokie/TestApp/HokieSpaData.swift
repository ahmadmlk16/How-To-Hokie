//
//  HokieSpaData.swift
//  TestApp
//
//  Created by Alex Cann on 12/8/19.
//  Copyright © 2019 Alex Cann. All rights reserved.
//

import Foundation
import SwiftUI
 
// Global array of HokieSpa structs
var hokieSpaStructList = [HokieSpa]()
 
/*
 ******************************
 MARK: - Read HokieSpa Data File
 ******************************
 */
public func readHokieSpaDataFile() {
   
    let HokieSpaDataFilename = "ArrayOfGeneralHokieSpaInformation.json"
   
    // Obtain URL of the HokieSpa data file in document directory on user's device
    let urlOfJsonFileInDocumentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(HokieSpaDataFilename)
 
    do {
        _ = try Data(contentsOf: urlOfJsonFileInDocumentDirectory)
       
        // HokieSpa data file exists in the document directory
 
        hokieSpaStructList = loadFromDocumentDirectory(HokieSpaDataFilename)
        print("HokieSpaData is loaded from document directory")
       
    } catch {
        // HokieSpa data file does not exist in the document directory; Load it from the main bundle.
       
        hokieSpaStructList = loadFromMainBundle(HokieSpaDataFilename)
        print("HokieSpaData is loaded from main bundle")
    }
}

/*
 *****************************************************
 MARK: - Write HokieSpa Data File to Document Directory
 *****************************************************
 */
public func writeHokieSpaDataFile() {
 
    // Obtain URL of the file in document directory on user's device
    // into which HokieSpa data will be written
    let urlOfJsonFileInDocumentDirectory: URL? = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("HokieSpaData.json")
 
    let encoder = JSONEncoder()
    if let encoded = try? encoder.encode(hokieSpaStructList) {
        do {
            try encoded.write(to: urlOfJsonFileInDocumentDirectory!)
        } catch {
            fatalError("Unable to write encoded HokieSpa data to document directory!")
        }
    } else {
        fatalError("Unable to encode HokieSpa data!")
    }
}
 


