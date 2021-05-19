//
//  CampusLife.swift
//  TestApp
//
//  Created by Alex Cann on 11/19/19.
//  Copyright © 2019 Alex Cann. All rights reserved.
//

import SwiftUI

struct CampusLife: View {
    var body: some View {
        NavigationView{
        
        VStack(alignment: .leading) {
            Text("Transportation")
                .font(.system(size: 32))
                .frame(width: UIScreen.main.bounds.width - 10, alignment: .center)
                .padding(.horizontal,10)
            Text("Blacksburg Transit is the name of the local busses that go all over the Blacksburg and Christiansburg Area. There are many routes that stop at almost all places in Blacksburg. Info on the routes can be found online or by using the BlacksburgTransit app. This is my preferred way to track the buses, since it has a live map, but be careful as often the live tracker is not up to date. The best way to ensure the bus schedule is to look at the timetable for bus stops, while the live map may be behind, the timetable is always accurate. Both the app and website can be found below.")
                .font(.system(size:12))
                .frame(width: UIScreen.main.bounds.width - 10, height: 130, alignment: .leading)
                .padding(.horizontal,10)
            HStack{
                Image("Blacksburg_Transit_logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .padding(10)
                NavigationLink(destination:
                WebView(showURL: "https://ridebt.org")
                    .navigationBarTitle(Text("BT Website"), displayMode: .inline) )
                {
                    Text("Blacksburg Transit Website")
                        .font(.system(size: 24))
                        .padding(10)
                }
            } // End of HStack
            Divider()
            
            Text("Things To Do")
                .font(.system(size: 32))
                .frame(width: UIScreen.main.bounds.width - 10, alignment: .center)
                .padding(.horizontal,10)
            Text("Below are links to list of differnt things to do.")
                .padding(.horizontal,10)
                .frame(width: UIScreen.main.bounds.width - 10, alignment: .center)
            HStack(alignment: .center){
                NavigationLink(destination: ActivityList())
                {
                    Text("Activities")
                        .font(.system(size: 24))
                        .padding(0)
                }
                NavigationLink(destination: EventList())
               {
                   Text("Events")
                       .font(.system(size: 24))
                       .padding(0)
               }
                NavigationLink(destination: ExplorationList())
                {
                    Text("Exploration")
                        .font(.system(size: 24))
                        .padding(0)
                }
            } // End of HStack
                .frame(width: UIScreen.main.bounds.width - 10, alignment: .center)
            Divider()
            
            //Clubs Group
            Group {
            
            Text("Clubs")
                .font(.system(size: 32))
                .frame(width: UIScreen.main.bounds.width - 10, alignment: .center)
                .padding(.horizontal,10)
            Text("There are a multitude of clubs at Virginia Tech, we have a link below to a list of clubs or for more general information on clubs visit GobblerConnect. ")
                .font(.system(size:16))
                .frame(width: UIScreen.main.bounds.width - 10, alignment: .center)
                .padding(.horizontal,10)
            HStack(alignment: .center){
                 NavigationLink(destination: ClubList())
                 {
                     Text("Clubs")
                         .font(.system(size: 24))
                         .padding(0)
                 }
                 NavigationLink(destination:
                 WebView(showURL: "https://gobblerconnect.vt.edu/")
                     .navigationBarTitle(Text("Gobbler Connect"), displayMode: .inline) )
                 {
                     Image("Gobbler")
                        .resizable()
                        .frame(width: 200, height: 40)
                 }
                .buttonStyle(PlainButtonStyle())
            } // End of HStack
                .frame(width: UIScreen.main.bounds.width - 10, alignment: .center)
            
            }
            
        } // End of VStack
            .frame(height: UIScreen.main.bounds.height - 10, alignment: .leading)
            .navigationBarTitle(Text("Campus Life"), displayMode: .inline)
        } //End NavigationView
            
    }
}

struct CampusLife_Previews: PreviewProvider {
    static var previews: some View {
        CampusLife()
    }
}
