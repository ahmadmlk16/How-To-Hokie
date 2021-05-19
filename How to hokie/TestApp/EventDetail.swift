//
//  EventDetail.swift
//  TestApp
//
//  Created by Alex Cann on 11/20/19.
//  Copyright © 2019 Alex Cann. All rights reserved.
//

import SwiftUI

struct EventDetail: View {
     let event: Event
       
       //Detail page for a trip
       
       var body: some View {
           Form{
               Section(header: Text("Event Name")){
                   Text(verbatim: event.name)
               } // End Section
               Section(header: Text("Event Date")){
                    Text(verbatim: event.date)
               } // End Section
               Section(header: Text("Photo")){
                   getImage(imageUrlString: event.pictureURL)
                       .resizable()
                       .aspectRatio(contentMode: .fit)
               } // End Section
               Section(header: Text("Description")){
                   Text(verbatim: event.description)
               } // End Section
               Section(header: Text("Learn More")){
                    NavigationLink(destination:
                        WebView(showURL: event.learnMore)
                            .navigationBarTitle(Text("Learn More"), displayMode: .inline) )
                        {
                            Text("Click To Learn More")
                        }
               } // End Section
           } // End From
           .font(.system(size: 14))
           .navigationBarTitle(Text("Trip Details"), displayMode: .inline)
       }
}

struct EventDetail_Previews: PreviewProvider {
    static var previews: some View {
        EventDetail(event: eventStructList[0])
    }
}
