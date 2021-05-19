//
//  ClubData.swift
//  TestApp
//
//  Created by Alex Cann on 11/19/19.
//  Copyright © 2019 Alex Cann. All rights reserved.
//

import Foundation
import SwiftUI
 
// Global array of Club structs
var clubStructList = [Club]()
 
/*
 ******************************
 MARK: - Read Club Data File
 ******************************
 */
public func readClubDataFile() {
   
    let ClubDataFilename = "ArrayOfClubs.json"
   
    // Obtain URL of the Club data file in document directory on user's device
    let urlOfJsonFileInDocumentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(ClubDataFilename)
 
    do {
        _ = try Data(contentsOf: urlOfJsonFileInDocumentDirectory)
       
        // Club data file exists in the document directory
 
        clubStructList = loadFromDocumentDirectory(ClubDataFilename)
        print("ClubData is loaded from document directory")
       
    } catch {
        // Club data file does not exist in the document directory; Load it from the main bundle.
       
        clubStructList = loadFromMainBundle(ClubDataFilename)
        print("ClubData is loaded from main bundle")
    }
}
 
/*
 *****************************************************
 MARK: - Write Club Data File to Document Directory
 *****************************************************
 */
public func writeClubDataFile() {
 
    // Obtain URL of the file in document directory on user's device
    // into which Club data will be written
    let urlOfJsonFileInDocumentDirectory: URL? = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("ClubData.json")
 
    let encoder = JSONEncoder()
    if let encoded = try? encoder.encode(clubStructList) {
        do {
            try encoded.write(to: urlOfJsonFileInDocumentDirectory!)
        } catch {
            fatalError("Unable to write encoded Club data to document directory!")
        }
    } else {
        fatalError("Unable to encode Club data!")
    }
}
 


