//
//  ExplorationItem.swift
//  TestApp
//
//  Created by Alex Cann on 11/20/19.
//  Copyright © 2019 Alex Cann. All rights reserved.
//

import SwiftUI

struct ExplorationItem: View {
    let exploration: Exploration
    
    var body: some View {
        HStack {
            getImage(imageUrlString: exploration.pictureURL)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80.0, height: 80.0)
            
            VStack(alignment: .leading) {
                Text(verbatim: exploration.spotName)
                HStack{
                    Text("Location: \(exploration.longitude), \(exploration.latitude)")
                }
                
            }   //End of VStack
            .font(.system(size: 14))
            
        } // End of HStack
    }
}

struct ExplorationItem_Previews: PreviewProvider {
    static var previews: some View {
        ExplorationItem(exploration: explorationStructList[0])
    }
}
