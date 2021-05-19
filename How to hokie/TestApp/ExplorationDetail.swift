//
//  ExplorationDetail.swift
//  TestApp
//
//  Created by Alex Cann on 11/20/19.
//  Copyright © 2019 Alex Cann. All rights reserved.
//

import SwiftUI
import MapKit

struct ExplorationDetail: View {
    let exploration: Exploration
    
    //Detail page for a trip
    
    var body: some View {
        Form{
            Section(header: Text("Exploration Name")){
                Text(verbatim: exploration.spotName)
            } // End Section
            Section(header: Text("Photo")){
                getImage(imageUrlString: exploration.pictureURL)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } // End Section
            Section(header: Text("Location")){
                NavigationLink(destination: mapLocation) {
                    Image(systemName: "map.fill")
                }
            } // End Section
            Section(header: Text("Description")){
                Text(verbatim: exploration.description)
            } // End Section
            Section(header: Text("Learn More")){
                 NavigationLink(destination:
                     WebView(showURL: exploration.learnMore)
                         .navigationBarTitle(Text("Learn More"), displayMode: .inline) )
                     {
                         Text("Click To Learn More")
                     }
            } // End Section
        } // End From
        .font(.system(size: 14))
        .navigationBarTitle(Text("Trip Details"), displayMode: .inline)
    }
    
    var mapLocation: some View {
        return AnyView(MapView(mapType: MKMapType.standard, latitude: exploration.latitude, longitude: exploration.longitude, delta: 1, deltaUnit: "degrees", annotationTitle: exploration.spotName, annotationSubtitle: exploration.spotName)
        .navigationBarTitle(Text(verbatim: exploration.spotName), displayMode: .inline)
        .edgesIgnoringSafeArea(.all) )
    }
}

struct ExplorationDetail_Previews: PreviewProvider {
    static var previews: some View {
        ExplorationDetail(exploration: explorationStructList[0])
    }
}
