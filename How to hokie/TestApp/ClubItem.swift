//
//  ClubItem.swift
//  TestApp
//
//  Created by Alex Cann on 11/20/19.
//  Copyright © 2019 Alex Cann. All rights reserved.
//

import SwiftUI

struct ClubItem: View {
    let club: Club
    
    var body: some View {
        HStack {
            getImage(imageUrlString: club.pictureURL)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80.0, height: 80.0)
            
            VStack(alignment: .leading) {
                Text(verbatim: club.name)
                HStack{
                    Text("Type: \(club.type)")
                }
                
            }   //End of VStack
            .font(.system(size: 14))
            
        } // End of HStack
    }
}

struct ClubItem_Previews: PreviewProvider {
    static var previews: some View {
        ClubItem(club: clubStructList[0])
    }
}
