//
//  EventItem.swift
//  TestApp
//
//  Created by Alex Cann on 11/20/19.
//  Copyright © 2019 Alex Cann. All rights reserved.
//

import SwiftUI

struct EventItem: View {
    let event: Event
    
    var body: some View {
        HStack {
            getImage(imageUrlString: event.pictureURL)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80.0, height: 80.0)
            
            VStack(alignment: .leading) {
                Text(verbatim: event.name)
                Text("Date: \(event.date)")
            }   //End of VStack
            .font(.system(size: 14))
            
        } // End of HStack
    }

}

struct EventItem_Previews: PreviewProvider {
    static var previews: some View {
        EventItem(event: eventStructList[0])
    }
}
