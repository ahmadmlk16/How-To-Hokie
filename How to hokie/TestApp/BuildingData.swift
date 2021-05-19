//
//  BuildingData.swift
//  TestApp
//
//  Created by Alex Cann on 11/19/19.
//  Copyright © 2019 Alex Cann. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit
import CoreLocation
 
var vtBuildings = [Building]()
var vtBuildingNames = [String]()
 
/*
 Instantiate a CLLocationManager object globally. If you do this in the currentLocation()
 function below, requestWhenInUseAuthorization() message quickly disappears and the user is not
 given enough time to authorize location determination because exiting the called function
 terminates the locationManager. If it is global, it stays even after exiting the function.
 */
let locationManager = CLLocationManager()
 
/*
*************************************
MARK: - Obtain Building Data from API
*************************************
*/
public func obtainBuildingDataFromApi() {
   
    //-----------------------------------------------------
    // Obtain the VT buildings JSON data from the given API
    // and parse it into an array of Building structs.
    //-----------------------------------------------------
   
    let apiUrl = URL(string: "http://orca.cs.vt.edu/VTBuildingsJAX-RS/webresources/vtBuildings/getAll")!
   
    let task = URLSession.shared.dataTask(with: apiUrl) { data, response, error in
        /*
         URLSession is established and the file from the apiUrl is set to be fetched
         in an asynchronous manner. After the file is fetched, data, response, error
         are returned as the parameter values of this Completion Handler Closure.
         */
        guard error == nil else {
            print ("URL Session Error: \(error!)")
            return
        }
        // Unwrap Optional 'data' fetched from the API if it has a value
        guard let dataObtained = data else {
            print("URL Session failed to obtain data from the API")
            return
        }
        do {
            // Parse the JSON dataObtained into an array of Building structs
            vtBuildings = try JSONDecoder().decode([Building].self, from: dataObtained)
           
            for building in vtBuildings {
                vtBuildingNames.append(building.name)
            }
        }
        catch {
            print("Unable to decode JSON data into an array of Building structs!")
        }
    }
    /*
     The URLSession task above is set up. It begins in a suspended state.
     Therefore, call the resume() method to start executing the task.
     */
    task.resume()
   
    /*
     The task is executed in an asynchronous manner. Therefore, you cannot include
     statements after task.resume() to process the returned data since it is unknown
     when the data will be fetched and the completion handler code will finish executing.
    
     Obtaining data from an API in an asynchronous manner provides better performance.
     However, it can be used only when you do not need the API data immediately.
     */
}
 
/*
********************************
MARK: - Obtain VT Building Image
********************************
*/
public func vtBuildingImage(urlForImage: String) -> Image {
   
    let bldgImgUrl = URL(string: urlForImage)
    var errorInReadingImageData: NSError?
    var imageData: Data?
   
    do {
        imageData = try Data(contentsOf: bldgImgUrl!, options: NSData.ReadingOptions.mappedIfSafe)
    } catch let error as NSError {
        errorInReadingImageData = error
        imageData = nil
    }
   
    if let vtBuildingImage = imageData {
        let uiImage = UIImage(data: vtBuildingImage)
        return Image(uiImage: uiImage!)
    } else {
        if errorInReadingImageData != nil {
            // Take no action since a VT building may not have an image.
        }
        // When there is no photo available for the building, display
        // the image named imageUnavailable.png
        return Image("imageUnavailable.png")
    }
}
 
/*
**************************************
MARK: - Obtain VT Building Description
**************************************
*/
public func vtBuildingDescription(urlForDescription: String) -> String {
   
    if let buildingDescriptionUrl = URL(string: urlForDescription) {
        do {
            return try String(contentsOf: buildingDescriptionUrl)
        } catch {
            print("Building description URL does not return the description text!")
            return ""
        }
    } else {
        print("Building description URL is invalid!")
        return ""
    }
}
 
/*
************************************************************
MARK: - Obtain and Return User's Current Location Coordinate
************************************************************
*/
public func currentLocation() -> CLLocationCoordinate2D {
    /*
     IMPORTANT NOTE: Current GPS location cannot be accurately determined under the iOS Simulator
     on your laptop or desktop computer because those computers do NOT have a GPS antenna.
     Therefore, do NOT expect the code herein to work under the iOS Simulator!
   
     You must deploy your location-aware app to an iOS device to be able to test it properly.
 
     Monitoring the user's current location is a serious privacy issue!
     You are required to get the user's permission in two ways:
   
     (1) requestWhenInUseAuthorization:
     (a) Ask your locationManager to request user's authorization while the app is being used.
     (b) Add a new row in the Info.plist file for "Privacy - Location When In Use Usage Description", for which you specify, e.g.,
     "VTQuest requires monitoring your location only when you are using the app!"
   
     (2) requestAlwaysAuthorization:
     (a) Ask your locationManager to request user's authorization even when the app is not being used.
     (b) Add a new row in the Info.plist file for "Privacy - Location Always Usage Description", for which you specify, e.g.,
     "VTQuest requires monitoring your location even when you are not using your app!"
   
     You select and use only one of these two options depending on your app's requirement.
     */
   
    // We will use Option 1: Request user's authorization while the app is being used.
    locationManager.requestWhenInUseAuthorization()
  
    // Instantiate a CLLocationCoordinate2D object with initial values
    var currentLocationCoordinate = CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
  
    /*
     The user can turn off location services on an iOS device in Settings.
     First, you must check to see of it is turned off or not.
     */
    if CLLocationManager.locationServicesEnabled() {
       
        // Set the location manager's desired accuracy to be the best
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
       
        // Start the generation of updates that report the user’s current location.
        locationManager.startUpdatingLocation()
      
        // Ask locationManager to obtain the user's current location coordinate
        if let location = locationManager.location {
            currentLocationCoordinate = location.coordinate
        } else {
            print("Unable to obtain user's current location")
        }
      
    } else {
        // Location Services turned off in Settings
        currentLocationCoordinate.latitude = -1.0
    }
    // Stop updating location when not needed to save battery of the device
    locationManager.stopUpdatingLocation()
  
    return currentLocationCoordinate
}
 
 
