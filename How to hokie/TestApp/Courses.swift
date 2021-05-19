//
//  Courses.swift
//  TestApp
//
//  Created by Alex Cann on 11/19/19.
//  Copyright © 2019 Alex Cann. All rights reserved.
//

import SwiftUI

struct Courses: View {
    // Segmented Picker: Part 1 of 3
    @State private var pickerSelectedIndex = 0
    
    // Segmented Picker: Part 2 of 3
    let pickerSelectionList = ["General Hokie Spa", "Duo Mobile", "Course Selection"]
    
    var body: some View {
        NavigationView {
            
        VStack {
            // Segmented Picker: Part 3 of 3
            Picker("Course Info", selection: $pickerSelectedIndex) {
                ForEach(0 ..< pickerSelectionList.count, id: \.self) { index in
                    Text(self.pickerSelectionList[index])
                        .tag(index)
                }
            }.pickerStyle(SegmentedPickerStyle())
            
            destinationView
            
        } // End of VStack
         .navigationBarTitle(Text("Courses"), displayMode: .inline)
        } // End of NavView
        
    }
    
    var destinationView: some View {
        switch pickerSelectedIndex {
        case 0:
            return AnyView(HokieSpaList())
        case 1:
        return AnyView(DuoMobileInfo())
        case 2:
            return AnyView(CourseRequest())
        default:
        fatalError("Selection is out of Range")
        }
    }
    
}

struct Courses_Previews: PreviewProvider {
    static var previews: some View {
        Courses()
    }
}
