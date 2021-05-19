//
//  ClubList.swift
//  TestApp
//
//  Created by Alex Cann on 11/20/19.
//  Copyright © 2019 Alex Cann. All rights reserved.
//

import SwiftUI

struct ClubList: View {
    var body: some View {
            List {
                ForEach(clubStructList, id: \.id) { anEvent in
                    NavigationLink(destination: ClubDetail(club: anEvent)) {
                        ClubItem(club: anEvent)
                    }
                }
            }   // End of List
            .navigationBarTitle(Text("Clubs"), displayMode: .inline)
            .navigationBarHidden(false)
         // End Navigation View
    }
}

struct ClubList_Previews: PreviewProvider {
    static var previews: some View {
        ClubList()
    }
}
