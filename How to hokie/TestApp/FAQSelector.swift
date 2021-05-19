//
//  FAQSelector.swift
//  TestApp
//
//  Created by Alex Cann on 12/9/19.
//  Copyright © 2019 Alex Cann. All rights reserved.
//

import SwiftUI

struct FAQSelector: View {
    var faq: FAQItem
    
     var body: some View {
         HStack {
             Image("vtLogo")
                 .resizable()
                 .aspectRatio(contentMode: .fit)
                 .frame(width: 40.0, height: 40.0)
             VStack(alignment: .leading) {
                 Text(verbatim: faq.question)
             }
             // Set font and size for the whole VStack content
             .font(.system(size: 14))
         }
         
     }
}
