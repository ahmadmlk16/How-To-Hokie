//
//  ActivityList.swift
//  TestApp
//
//  Created by Alex Cann on 11/20/19.
//  Copyright © 2019 Alex Cann. All rights reserved.
//

import SwiftUI

struct ActivityList: View {
    var body: some View {
            List {
                ForEach(activityStructList, id: \.id) { anActivity in
                    NavigationLink(destination: ActivityDetail(activity: anActivity)) {
                        ActivityItem(activity: anActivity)
                    }
                }
            }   // End of List
            .navigationBarTitle(Text("Activities"), displayMode: .inline)
            
        // End Navigation View
    }
}

struct ActivityList_Previews: PreviewProvider {
    static var previews: some View {
        ActivityList()
    }
}
