//
//  FAQDetail.swift
//  TestApp
//
//  Created by Alex Cann on 12/9/19.
//  Copyright © 2019 Alex Cann. All rights reserved.
//

import SwiftUI

struct FAQDetail: View {
    let faq: FAQItem
    
    //Detail page for a trip
    
    var body: some View {
        Form{
            Section(header: Text("Question")){
                Text(verbatim: faq.question)
            } // End Section
            Section(header: Text("Answer")){
                VStack {
                    Text(verbatim: faq.answer)
                    Text("")
                }   // End VStack
            } // End Section
            
        } // End From
        .font(.system(size: 14))
    }
}

