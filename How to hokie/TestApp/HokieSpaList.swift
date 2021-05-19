//
//  HokieSpaList.swift
//  TestApp
//
//  Created by Alex Cann on 12/8/19.
//  Copyright © 2019 Alex Cann. All rights reserved.
//

import SwiftUI

struct HokieSpaList: View {
    var body: some View {
        NavigationView{
            List {
                ForEach(hokieSpaStructList, id: \.id) { anEvent in
                    NavigationLink(destination: HokieSpaDetail(hokieSpa: anEvent)) {
                        HokieSpaItem(hokieSpa: anEvent)
                    }
                }
            }   // End of List
            .navigationBarTitle(Text("Hokie Spa Help"), displayMode: .inline)
            .navigationBarHidden(true)
        }// End Navigation View
    }
}

struct HokieSpaList_Previews: PreviewProvider {
    static var previews: some View {
        HokieSpaList()
    }
}
