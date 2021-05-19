//
//  FAQ.swift
//  TestApp
//
//  Created by Alex Cann on 11/19/19.
//  Copyright © 2019 Alex Cann. All rights reserved.
//

import SwiftUI

struct FAQ: View {
    var body: some View {
         NavigationView{
                   List {
                       ForEach(FAQStructList, id: \.id) { anEvent in
                           NavigationLink(destination: FAQDetail(faq: anEvent)) {
                               FAQSelector(faq: anEvent)
                           }
                       }
                   }   // End of List
                   .navigationBarTitle(Text("FAQ"), displayMode: .inline)
                   .navigationBarHidden(false)
               }// End Navigation View
    }
}

struct FAQ_Previews: PreviewProvider {
    static var previews: some View {
        FAQ()
    }
}
