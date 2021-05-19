//
//  EventData.swift
//  TestApp
//
//  Created by Alex Cann on 11/19/19.
//  Copyright © 2019 Alex Cann. All rights reserved.
//

import Foundation
import SwiftUI
 
// Global array of Event structs
var eventStructList = [Event]()
 
/*
 ******************************
 MARK: - Read Event Data File
 ******************************
 */
public func readEventDataFile() {
   
    let EventDataFilename = "ArrayOfEvents.json"
   
    // Obtain URL of the Event data file in document directory on user's device
    let urlOfJsonFileInDocumentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(EventDataFilename)
 
    do {
        _ = try Data(contentsOf: urlOfJsonFileInDocumentDirectory)
       
        // Event data file exists in the document directory
 
        eventStructList = loadFromDocumentDirectory(EventDataFilename)
        print("EventData is loaded from document directory")
       
    } catch {
        // Event data file does not exist in the document directory; Load it from the main bundle.
       
        eventStructList = loadFromMainBundle(EventDataFilename)
        print("EventData is loaded from main bundle")
    }
}
 
/*
 *****************************************************
 MARK: - Write Event Data File to Document Directory
 *****************************************************
 */
public func writeEventDataFile() {
 
    // Obtain URL of the file in document directory on user's device
    // into which Event data will be written
    let urlOfJsonFileInDocumentDirectory: URL? = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("EventData.json")
 
    let encoder = JSONEncoder()
    if let encoded = try? encoder.encode(eventStructList) {
        do {
            try encoded.write(to: urlOfJsonFileInDocumentDirectory!)
        } catch {
            fatalError("Unable to write encoded Event data to document directory!")
        }
    } else {
        fatalError("Unable to encode Event data!")
    }
}
 


