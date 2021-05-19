//
//  HokieSpa.swift
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
 
struct HokieSpa: Hashable, Codable, Identifiable {
    
    var id: Int
    var Title: String
    var Step1: String
    var pictureURL1: String
    var Step2: String
    var pictureURL2: String
    var Step3: String
    var pictureURL3: String
    var Step4: String
    var pictureURL4: String
    var Step5: String
    var pictureURL5: String
    
}
