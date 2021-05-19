//
//  OnCampusDetail.swift
//  TestApp
//
//  Created by Alex Cann on 12/8/19.
//  Copyright © 2019 Alex Cann. All rights reserved.
//

import SwiftUI
import MapKit

struct OnCampusDetail: View {
    let location: OnCampus
    
    //Detail page for a trip
    
    var body: some View {
        Form{
            Section(header: Text("Restaurant Name")){
                Text(verbatim: location.name)
            } // End Section
            Section(header: Text("Restaurant Rating")){
                Text("\(location.rating)")
            } // End Section
            Section(header: Text("Photo")){
                getImage(imageUrlString: location.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } // End Section
            
            Section(header: Text("Description")){
                Text(verbatim: location.description)
            } // End Section
            
            Section(header: Text("Hours")){
                Text(verbatim: location.timing)
            } // End Section

            Section(header: Text("Menu Website")){
                NavigationLink(destination:
                WebView(showURL: location.menuWebsite)
                    .navigationBarTitle(Text("Menu Website"), displayMode: .inline) )
                {
                    Text("Click to view the restaurant website.")
                }
            } // End Section
            
            Section(header: Text("Address")){
                Text(verbatim: location.address)
            } // End Section
            
            Section(header: Text("Location")){
                NavigationLink(destination: mapLocation) {
                    Image(systemName: "map.fill")
                }
            } // End Section
            
        } // End From
        .font(.system(size: 14))
        .navigationBarTitle(Text("Restaurant Details"), displayMode: .inline)
    }
    
    var mapLocation: some View {
        let lat = Double(location.lat) ?? 0.0
        let long = Double(location.long) ?? 0.0
        
        return AnyView(MapView(mapType: MKMapType.standard, latitude: lat, longitude: long, delta: 1000, deltaUnit: "meters", annotationTitle: location.name, annotationSubtitle: location.name)
        .navigationBarTitle(Text(verbatim: location.name), displayMode: .inline)
        .edgesIgnoringSafeArea(.all) )
    }
}
