//
//  Dinning.swift
//  TestApp
//
//  Created by Alex Cann on 11/19/19.
//  Copyright © 2019 Alex Cann. All rights reserved.
//

import SwiftUI

struct Dining: View {
    
    // Segmented Picker: Part 1 of 3
    @State private var pickerSelectedIndex = 0
    
    // Segmented Picker: Part 2 of 3
    let pickerSelectionList = ["On Campus", "Off Campus"]
    
    var body: some View {
        NavigationView {
            
        VStack {
            // Segmented Picker: Part 3 of 3
            Picker("Dining Location", selection: $pickerSelectedIndex) {
                ForEach(0 ..< pickerSelectionList.count, id: \.self) { index in
                    Text(self.pickerSelectionList[index])
                        .tag(index)
                }
            }.pickerStyle(SegmentedPickerStyle())
            
            destinationView
            
        } // End of VStack
         .navigationBarTitle(Text("Dining"), displayMode: .inline)
        } // End of NavView
        
    }
    
    var destinationView: some View {
        switch pickerSelectedIndex {
        case 0:
            return AnyView(onCampus)
        case 1:
            return AnyView(offCampus)
        default:
        fatalError("Selection is out of Range")
        }
    }
    
    var offCampus: some View {
            List {
               ForEach(offCampusStructList, id: \.id) { aRestaurant in
                   NavigationLink(destination: OffCampusDetail(location: aRestaurant)) {
                       OffCampusItem(location: aRestaurant)
                   }
               }
           }   // End of List
        // End Navigation View
    }
    
    var onCampus: some View {
            List(onCampusStructList, id: \.id) { aBuilding in
                    NavigationLink(destination: OnCampusDetail(location: aBuilding)) {
                        OnCampusItem(location: aBuilding)
                    }
            }

        // End Navigation View
    }
}
