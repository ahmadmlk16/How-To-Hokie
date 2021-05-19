//
//  ActivityDetail.swift
//  TestApp
//
//  Created by Alex Cann on 11/20/19.
//  Copyright © 2019 Alex Cann. All rights reserved.
//

import SwiftUI

struct ActivityDetail: View {
    let activity: Activity
    
    //Detail page for a trip
    
    var body: some View {
        Form{
            Section(header: Text("Activity Name")){
                Text(verbatim: activity.name)
            } // End Section
            Section(header: Text("Photo")){
                getImage(imageUrlString: activity.pictureURL)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } // End Section
            Section(header: Text("Description")){
                Text(verbatim: activity.description)
            } // End Section
        } // End From
        .font(.system(size: 14))
        .navigationBarTitle(Text("Trip Details"), displayMode: .inline)
    }
}

struct ActivityDetail_Previews: PreviewProvider {
    static var previews: some View {
        ActivityDetail(activity: activityStructList[0])
    }
}
