//
//  OffCampusData.swift
//  TestApp
//
//  Created by Alex Cann on 12/8/19.
//  Copyright © 2019 Alex Cann. All rights reserved.
//

import Foundation
import SwiftUI
 
// Global array of OffCampus structs
var offCampusStructList = [OffCampus]()
var onCampusStructList = [OnCampus]()
 
/*
 ******************************
 MARK: - Read OffCampus Data File
 ******************************
 */
public func readOffCampusDataFile() {
   
    let OffCampusDataFilename = "off_campus.json"
   
    // Obtain URL of the OffCampus data file in document directory on user's device
    let urlOfJsonFileInDocumentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(OffCampusDataFilename)
 
    do {
        _ = try Data(contentsOf: urlOfJsonFileInDocumentDirectory)
       
        // OffCampus data file exists in the document directory
 
        offCampusStructList = loadFromDocumentDirectory(OffCampusDataFilename)
        print("OffCampusData is loaded from document directory")
       
    } catch {
        // OffCampus data file does not exist in the document directory; Load it from the main bundle.
       
        offCampusStructList = loadFromMainBundle(OffCampusDataFilename)
        print("OffCampusData is loaded from main bundle")
    }
}

/*
 *****************************************************
 MARK: - Write OffCampus Data File to Document Directory
 *****************************************************
 */
public func writeOffCampusDataFile() {
 
    // Obtain URL of the file in document directory on user's device
    // into which OffCampus data will be written
    let urlOfJsonFileInDocumentDirectory: URL? = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("OffCampusData.json")
 
    let encoder = JSONEncoder()
    if let encoded = try? encoder.encode(offCampusStructList) {
        do {
            try encoded.write(to: urlOfJsonFileInDocumentDirectory!)
        } catch {
            fatalError("Unable to write encoded OffCampus data to document directory!")
        }
    } else {
        fatalError("Unable to encode OffCampus data!")
    }
}
 
/*
 ******************************
 MARK: - Read OnCampus Data File
 ******************************
 */
public func readOnCampusDataFile() {
   
    let OnCampusDataFilename = "ArrayOfCampusDining.json"
   
    // Obtain URL of the OnCampus data file in document directory on user's device
    let urlOfJsonFileInDocumentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(OnCampusDataFilename)
 
    do {
        _ = try Data(contentsOf: urlOfJsonFileInDocumentDirectory)
       
        // OnCampus data file exists in the document directory
 
        onCampusStructList = loadFromDocumentDirectory(OnCampusDataFilename)
        print("OnCampusData is loaded from document directory")
       
    } catch {
        // OnCampus data file does not exist in the document directory; Load it from the main bundle.
       
        onCampusStructList = loadFromMainBundle(OnCampusDataFilename)
        print("OnCampusData is loaded from main bundle")
    }
}

/*
 *****************************************************
 MARK: - Write OnCampus Data File to Document Directory
 *****************************************************
 */
public func writeOnCampusDataFile() {
 
    // Obtain URL of the file in document directory on user's device
    // into which OnCampus data will be written
    let urlOfJsonFileInDocumentDirectory: URL? = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("OnCampusData.json")
 
    let encoder = JSONEncoder()
    if let encoded = try? encoder.encode(onCampusStructList) {
        do {
            try encoded.write(to: urlOfJsonFileInDocumentDirectory!)
        } catch {
            fatalError("Unable to write encoded OnCampus data to document directory!")
        }
    } else {
        fatalError("Unable to encode OnCampus data!")
    }
}
