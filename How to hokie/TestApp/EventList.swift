//
//  EventList.swift
//  TestApp
//
//  Created by Alex Cann on 11/20/19.
//  Copyright © 2019 Alex Cann. All rights reserved.
//

import SwiftUI

struct EventList: View {
    var body: some View {
            List {
                ForEach(eventStructList, id: \.id) { anEvent in
                    NavigationLink(destination: EventDetail(event: anEvent)) {
                        EventItem(event: anEvent)
                    }
                }
            }   // End of List
            .navigationBarTitle(Text("Events"), displayMode: .inline)
            .navigationBarHidden(false)
         // End Navigation View
    }
}

struct EventList_Previews: PreviewProvider {
    static var previews: some View {
        EventList()
    }
}
