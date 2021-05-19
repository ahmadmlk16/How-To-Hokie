//
//  HokieSpaItem.swift
//  TestApp
//
//  Created by Alex Cann on 12/8/19.
//  Copyright © 2019 Alex Cann. All rights reserved.
//

import SwiftUI

struct HokieSpaItem: View {
    let hokieSpa: HokieSpa
    
    var body: some View {
        HStack {
            Image("vtLogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40.0, height: 40.0)
            VStack(alignment: .leading) {
                Text(verbatim: hokieSpa.Title)
            }   //End of VStack
            .font(.system(size: 14))
        } // End of HStack
    }
}

