//
//  ClubDetail.swift
//  TestApp
//
//  Created by Alex Cann on 11/20/19.
//  Copyright © 2019 Alex Cann. All rights reserved.
//

import SwiftUI

struct ClubDetail: View {
    let club: Club
    
    //Detail page for a trip
    
    var body: some View {
        Form{
            Section(header: Text("Club Name")){
                Text(verbatim: club.name)
            } // End Section
            Section(header: Text("Club Type")){
                Text(verbatim: club.type)
            } // End Section
            Section(header: Text("Photo")){
                getImage(imageUrlString: club.pictureURL)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } // End Section
            
            Section(header: Text("Purpose")){
                Text(verbatim: club.purpose)
            } // End Section
            Section(header: Text("Contact")){
                VStack{
                    Text("Email: \(club.contactEmail)")
                    Text("Phone: \(club.contactPhone)")
                }
            } // End Section
            Section(header: Text("Website")){
                NavigationLink(destination:
                WebView(showURL: club.website)
                    .navigationBarTitle(Text("Club Website"), displayMode: .inline) )
                {
                    Text("Click to view the club website")
                }
            } // End Section
            Section(header: Text("Learn More")){
                 NavigationLink(destination:
                     WebView(showURL: club.gobblerConnect)
                         .navigationBarTitle(Text("GobblerConnect"), displayMode: .inline) )
                     {
                         Text("Click To view the club on GobblerConnect")
                     }
            } // End Section
            
        } // End From
        .font(.system(size: 14))
        .navigationBarTitle(Text("Trip Details"), displayMode: .inline)
    }
}

struct ClubDetail_Previews: PreviewProvider {
    static var previews: some View {
        ClubDetail(club: clubStructList[0])
    }
}
