//
//  ExplorationList.swift
//  TestApp
//
//  Created by Alex Cann on 11/20/19.
//  Copyright © 2019 Alex Cann. All rights reserved.
//

import SwiftUI

struct ExplorationList: View {
    var body: some View {
            List {
                ForEach(explorationStructList, id: \.id) { anEvent in
                    NavigationLink(destination: ExplorationDetail(exploration: anEvent)) {
                        ExplorationItem(exploration: anEvent)
                    }
                }
            }   // End of List
            .navigationBarTitle(Text("Exploration"), displayMode: .inline)
            .navigationBarHidden(false)
         // End Navigation View
    }
}

struct ExplorationList_Previews: PreviewProvider {
    static var previews: some View {
        ExplorationList()
    }
}
