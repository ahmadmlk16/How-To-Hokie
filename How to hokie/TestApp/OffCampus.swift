//
//  OffCampus.swift
//  TestApp
//
//  Created by Alex Cann on 12/8/19.
//  Copyright © 2019 Alex Cann. All rights reserved.
//

import Foundation
import SwiftUI
 
//------------------------------------------------------
// The Building struct below is created to represent the
// properties of a JSON object returned from the API.
//------------------------------------------------------
 
struct OffCampus: Hashable, Codable, Identifiable {
    
    var id: Int
    var name: String
    var rating: Double
    var latitude: Double
    var longitude: Double
    var pictureURL: String
    var description: String
    var site: String
    
}

struct OnCampus: Hashable, Codable, Identifiable {
    
    var id: Int
    var name: String
    var description: String
    var image: String
    var timing:  String
    var rating: String
    var address: String
    var lat: String
    var long: String
    var menuWebsite: String
    
}
