//
//  DataType.swift
//  TestApp
//
//  Created by Alex Cann on 11/19/19.
//  Copyright © 2019 Alex Cann. All rights reserved.
//

import Foundation
import SwiftUI
 
//------------------------------------------------------
// The Building struct below is created to represent the
// properties of a JSON object returned from the API.
//------------------------------------------------------
 
struct Activity: Hashable, Codable, Identifiable {
    
    var id: Int
    var name: String
    var pictureURL: String
    var description: String
    
}

struct Club: Hashable, Codable, Identifiable {
    
    var id: Int
    var name: String
    var pictureURL: String
    var type: String
    var purpose: String
    var contactEmail: String
    var contactPhone: String
    var gobblerConnect: String
    var website: String
    
}

struct Event: Hashable, Codable, Identifiable {
    
    var id: Int
    var name: String
    var date: String
    var description: String
    var pictureURL: String
    var learnMore: String
    
}

struct Exploration: Hashable, Codable, Identifiable {
    
    var id: Int
    var spotName: String
    var pictureURL: String
    var description: String
    var latitude: Double
    var longitude: Double
    var learnMore: String
    
}

struct Building: Hashable, Codable, Identifiable {
    
    var id: Int
    var name: String
    var abbreviation: String
    var category: String
    var descriptionUrl: String
    var imageUrl: String
    var latitude: Double
    var longitude: Double
    
}
 
/*
 This API is created by Dr. Balci and runs on his production server orca.cs.vt.edu
 The API query "http://orca.cs.vt.edu/VTBuildingsJAX-RS/webresources/vtBuildings/getAll"
 returns an array of 115 JSON objects representing VT buildings. One of them is shown below:
 {
 "abbreviation":"AGNEW",
 "category":"Academic",
 "descriptionUrl":"https://manta.cs.vt.edu/vt/buildings/agnew/agnew.txt",
 "id":1,    // id is the Database Primary Key uniquely identifying each building
 "imageUrl":"https://manta.cs.vt.edu/vt/buildings/agnew/agnew.jpg",
 "latitude":37.2247741885,
 "longitude":-80.4241237773,
 "name":"Agnew Hall"
 }
 */

