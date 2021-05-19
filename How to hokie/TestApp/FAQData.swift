//
//  FAQData.swift
//  TestApp
//
//  Created by Alex Cann on 12/9/19.
//  Copyright © 2019 Alex Cann. All rights reserved.
//


import Foundation
import SwiftUI
 
// Global array of FAQItem structs
var FAQStructList = [FAQItem]()
 
/*
 ******************************
 MARK: - Read FAQItem Data File
 ******************************
 */
public func readFAQItemDataFile() {
   
    let FAQItemDataFilename = "ArrayOfFAQ.json"
   
    // Obtain URL of the FAQItem data file in document directory on user's device
    let urlOfJsonFileInDocumentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(FAQItemDataFilename)
 
    do {
        _ = try Data(contentsOf: urlOfJsonFileInDocumentDirectory)
       
        // FAQItem data file exists in the document directory
 
        FAQStructList = loadFromDocumentDirectory(FAQItemDataFilename)
        print("FAQItemData is loaded from document directory")
       
    } catch {
        // FAQItem data file does not exist in the document directory; Load it from the main bundle.
       
        FAQStructList = loadFromMainBundle(FAQItemDataFilename)
        print("FAQItemData is loaded from main bundle")
    }
}

/*
 *****************************************************
 MARK: - Write FAQItem Data File to Document Directory
 *****************************************************
 */
public func writeFAQItemDataFile() {
 
    // Obtain URL of the file in document directory on user's device
    // into which FAQItem data will be written
    let urlOfJsonFileInDocumentDirectory: URL? = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("FAQItemData.json")
 
    let encoder = JSONEncoder()
    if let encoded = try? encoder.encode(FAQStructList) {
        do {
            try encoded.write(to: urlOfJsonFileInDocumentDirectory!)
        } catch {
            fatalError("Unable to write encoded FAQItem data to document directory!")
        }
    } else {
        fatalError("Unable to encode FAQItem data!")
    }
}
 
