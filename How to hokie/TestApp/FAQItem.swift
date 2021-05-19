//
//  FAQItem.swift
//  TestApp
//
//  Created by Alex Cann on 12/9/19.
//  Copyright © 2019 Alex Cann. All rights reserved.
//

import Foundation
import SwiftUI
 
//------------------------------------------------------
// The Building struct below is created to represent the
// properties of a JSON object returned from the API.
//------------------------------------------------------
 
struct FAQItem: Hashable, Codable, Identifiable {
    
    var id: Int
    var question: String
    var answer: String
    
}
