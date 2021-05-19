//
//  ActivityItem.swift
//  TestApp
//
//  Created by Alex Cann on 11/20/19.
//  Copyright © 2019 Alex Cann. All rights reserved.
//

import SwiftUI

struct ActivityItem: View {
    let activity: Activity
    
    var body: some View {
        HStack {
            getImage(imageUrlString: activity.pictureURL)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80.0, height: 80.0)
            
            VStack(alignment: .leading) {
                Text(verbatim: activity.name)
            }   //End of VStack
            .font(.system(size: 20))
            
        } // End of HStack
    }
}

struct ActivityItem_Previews: PreviewProvider {
    static var previews: some View {
        ActivityItem(activity: activityStructList[0])
    }
}
