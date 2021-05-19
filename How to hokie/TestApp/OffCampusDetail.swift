//
//  OffCampusDetail.swift
//  TestApp
//
//  Created by Alex Cann on 12/8/19.
//  Copyright © 2019 Alex Cann. All rights reserved.
//

import SwiftUI
import MapKit

struct OffCampusDetail: View {
    let location: OffCampus
    
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
                getImage(imageUrlString: location.pictureURL)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } // End Section
            
            Section(header: Text("Description")){
                Text(verbatim: location.description)
            } // End Section

            Section(header: Text("Website")){
                NavigationLink(destination:
                WebView(showURL: location.site)
                    .navigationBarTitle(Text("Restaurant Website"), displayMode: .inline) )
                {
                    Text("Click to view the restaurant website.")
                }
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
        return AnyView(MapView(mapType: MKMapType.standard, latitude: location.latitude, longitude: location.longitude, delta: 1000, deltaUnit: "meters", annotationTitle: location.name, annotationSubtitle: location.name)
        .navigationBarTitle(Text(verbatim: location.name), displayMode: .inline)
        .edgesIgnoringSafeArea(.all) )
    }
}

struct OffCampusDetail_Previews: PreviewProvider {
    static var previews: some View {
        OffCampusDetail(location: offCampusStructList[0])
    }
}
