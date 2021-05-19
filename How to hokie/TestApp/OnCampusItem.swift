//
//  OnCampusItem.swift
//  TestApp
//
//  Created by Alex Cann on 12/8/19.
//  Copyright © 2019 Alex Cann. All rights reserved.
//

import SwiftUI

struct OnCampusItem: View {
    let location: OnCampus
    
    var body: some View {
        HStack {
            getImage(imageUrlString: location.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80.0, height: 80.0)
            
            VStack(alignment: .leading) {
                Text(verbatim: location.name)
                HStack{
                    Text("Rating: \(location.rating)")
                }
                
            }   //End of VStack
            .font(.system(size: 14))
            
        } // End of HStack
    }
}
