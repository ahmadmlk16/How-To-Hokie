//
//  HokieSpaDetail.swift
//  TestApp
//
//  Created by Alex Cann on 12/8/19.
//  Copyright © 2019 Alex Cann. All rights reserved.
//

import SwiftUI

struct HokieSpaDetail: View {
    let hokieSpa: HokieSpa
    
    //Detail page for a trip
    
    var body: some View {
        Form{
            Section(header: Text("Title")){
                Text(verbatim: hokieSpa.Title)
            } // End Section
            Section(header: Text("Step 1")){
                VStack {
                    Text(verbatim: hokieSpa.Step1)
                    getImage(imageUrlString: hokieSpa.pictureURL1)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                }   // End VStack
            } // End Section
            Section(header: Text("Step 2")){
                VStack {
                    Text(verbatim: hokieSpa.Step2)
                   getImage(imageUrlString: hokieSpa.pictureURL2)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                   
               }   // End VStack
            } // End Section
            
            if hokieSpa.Step3 != "" {
                Section(header: Text("Step 3")){
                    VStack {
                        Text(verbatim: hokieSpa.Step3)
                       getImage(imageUrlString: hokieSpa.pictureURL3)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                       
                   }   // End VStack
                } // End Section
            }
            
            if hokieSpa.Step4 != "" {
                Section(header: Text("Step 4")){
                    VStack {
                        Text(verbatim: hokieSpa.Step4)
                       getImage(imageUrlString: hokieSpa.pictureURL4)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                       
                   }   // End VStack
                } // End Section
            }
            
            if hokieSpa.Step5 != "" {
                Section(header: Text("Step 5")){
                    VStack {
                        Text(verbatim: hokieSpa.Step5)
                       getImage(imageUrlString: hokieSpa.pictureURL5)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                       
                   }   // End VStack
                } // End Section
            }
            
        } // End From
        .font(.system(size: 14))
        .navigationBarTitle(Text("Hokie Spa Help"), displayMode: .inline)
    }
}

