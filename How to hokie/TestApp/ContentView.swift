//
//  ContentView.swift
//  TestApp
//
//  Created by Alex Cann on 11/11/19.
//  Copyright © 2019 Alex Cann. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
    
           TabView {
               Dining()
                   .tabItem {
                       Image(systemName: "heart.fill")
                       Text("Dining")
                   }
               Housing()
                   .tabItem {
                       Image(systemName: "house.fill")
                       Text("Housing")
                   }
               Courses()
                   .tabItem {
                       Image(systemName: "square.and.pencil")
                       Text("Courses")
                   }
               CampusLife()
                   .tabItem {
                       Image(systemName: "person.fill")
                       Text("Campus Life")
                   }
                FAQ()
                    .tabItem {
                        Image(systemName: "questionmark.circle")
                        Text("FAQ")
                    }
           }   // End of TabView
           .font(.headline)
           .imageScale(.medium)
           .font(Font.title.weight(.regular))
       }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
