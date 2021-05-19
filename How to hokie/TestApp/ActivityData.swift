//
//  ActivityData.swift
//  TestApp
//
//  Created by Alex Cann on 11/19/19.
//  Copyright © 2019 Alex Cann. All rights reserved.
//

import Foundation
import SwiftUI
 
// Global array of Activity structs
var activityStructList = [Activity]()
 
/*
 ******************************
 MARK: - Read Activity Data File
 ******************************
 */
public func readActivityDataFile() {
   
    let ActivityDataFilename = "ArrayOfCampusActivites.json"
   
    // Obtain URL of the Activity data file in document directory on user's device
    let urlOfJsonFileInDocumentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(ActivityDataFilename)
 
    do {
        _ = try Data(contentsOf: urlOfJsonFileInDocumentDirectory)
       
        // Activity data file exists in the document directory
 
        activityStructList = loadFromDocumentDirectory(ActivityDataFilename)
        print("ActivityData is loaded from document directory")
       
    } catch {
        // Activity data file does not exist in the document directory; Load it from the main bundle.
       
        activityStructList = loadFromMainBundle(ActivityDataFilename)
        print("ActivityData is loaded from main bundle")
    }
}
 
/*
***********************************************
MARK: - Load Activity Data File from Main Bundle
***********************************************
*/
func loadFromMainBundle<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
   
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Unable to find \(filename) in main bundle.")
    }
   
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Unable to load \(filename) from main bundle:\n\(error)")
    }
   
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse \(filename) as \(T.self):\n\(error)")
    }
}
 
/*
 *****************************************************
 MARK: - Write Activity Data File to Document Directory
 *****************************************************
 */
public func writeActivityDataFile() {
 
    // Obtain URL of the file in document directory on user's device
    // into which Activity data will be written
    let urlOfJsonFileInDocumentDirectory: URL? = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("ActivityData.json")
 
    let encoder = JSONEncoder()
    if let encoded = try? encoder.encode(activityStructList) {
        do {
            try encoded.write(to: urlOfJsonFileInDocumentDirectory!)
        } catch {
            fatalError("Unable to write encoded Activity data to document directory!")
        }
    } else {
        fatalError("Unable to encode Activity data!")
    }
}
 
/*
******************************************************
MARK: - Load Activity Data File from Document Directory
******************************************************
*/
func loadFromDocumentDirectory<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
   
    // Obtain the URL of the JSON file in the document directory on the user's device
    let urlOfJsonFileInDocumentDirectory: URL? = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(filename)
   
    guard let file = urlOfJsonFileInDocumentDirectory
        else {
            fatalError("Unable to find \(filename) in document directory.")
    }
   
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Unable to load \(filename) from document directory:\n\(error)")
    }
   
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse \(filename) as \(T.self):\n\(error)")
    }
}

/*
*********************************
MARK: - Obtain Image
*********************************
*/
public func getImage(imageUrlString: String) -> Image {
   
    // Local Variables
    var errorInReadingImageData: NSError?
    var imageData: Data?
   
    if let imageUrl = URL(string: imageUrlString) {
       
        do {
            // Try to get the image data from imageUrl
            imageData = try Data(contentsOf: imageUrl, options: NSData.ReadingOptions.mappedIfSafe)
           
        } catch let error as NSError {
            errorInReadingImageData = error
            imageData = nil
        }
       
        // Unwrap imageData to see if it has a value
        if let imageDataObtained = imageData {
           
            // Create a UIImage object from imageDataObtained
            let uiImage = UIImage(data: imageDataObtained)
           
            // Unwrap uiImage to see if it has a value
            if let imageObtained = uiImage {
                // Image is successfully obtained
                return Image(uiImage: imageObtained)
            } else {
                return Image("ImageUnavailable")
            }
        } else {
            if errorInReadingImageData != nil {
                // Take no action since image may not be available
            }
            // When there is no image available, display ImageUnavailable.png
            // Do NOT include file extension.
            return Image("ImageUnavailable")
        }
       
    } else {
        return Image("ImageUnavailable")
    }
   
}


