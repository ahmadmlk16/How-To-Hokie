//
//  CourseRequest.swift
//  TestApp
//
//  Created by Alex Cann on 12/9/19.
//  Copyright © 2019 Alex Cann. All rights reserved.
//

import SwiftUI

struct CourseRequest: View {
    
    let area1 = "This requirement is filled by almost all majors general English classes, ENLG 1105 and ENGL 1106 are the English classes most freshman take to fill this area."
    let area2 = "CLA 2444 Greek and Roman Myth or 1024 Ancient History: Both classes are exam-based classes, but the exams are take home, online exams. There are a couple books that are supposed to be read along side the class, but I found the books rather interesting, and if needed, the information about the books given in lectures was enough to get me through the exams. The professors for these classes are both very good story tellers, and make the information presented very interesting during lectures. "
    let area3or7 = "GEOG 1014 World Regions: Both an area 3 and 7 world regions is the most popular class at Virginia Tech. The class is an online course, that uses a unique point system to grade the class. Getting an A in this class is extremely easy and this is the class everyone should take if they need an area 3 or 7. "
    let area4 = "This requirement is filled for most technical majors, but if a science is needed, I recommend taking a class that is interesting to you, as some of these classes can be very out of some people comfort zone. In general, I would recommend taking physics or biology over chemistry if looking into the physical sciences, since general chemistry is often used as a weed-out class for the technical majors."
    let area5 = "Again, this requirement is filled for most technical majors, but if a math course is needed, I would again pick a course that has some interest to you. The only caveat is to stray away from courses that are offered online and at the Math Empo, since they are very different from other online courses at Virginia Tech. The Math Empo is where online math classes have weekly quizzes or exams and are some of the worst classes at Virginia Tech. Additionally, I would avoid lower level calculus classes, as again they are used to weed people out of the technical majors, and are harder than other general math classes. "
    let area6 = "CINE 2054 Introduction to Cinema: This is another exam only class, but I highly recommend it for people that need area 6 classes. The class is a 3-credit class but only meets twice a week for 50 minutes, since the other class is used to watch a movie. It goes in depth on cinema and film making and gives a unique understanding of movies that are so influential in pop culture.\n\nITDS 1114 Design Appreciation: One of the more popular classes at Tech for a reason, design appreciation is an easy A online course that fulfills the area 6 requirement. If looking for an easy A and willing to put in the work for an online class this is the best class to take to meet the area 6 requirements."
    
    let withdraw = "At Virginia Tech, you have 3 course withdraws (W) for your entire undergraduate at Virginia  Tech. Course withdraw are for the classes that you want to drop but it is after  the drop deadline, say your failing a class, but it is week 10. Doing a course withdraw will put a W on your transcript and the class does not affect your GPA. Submitting a course withdraw is different depending on majors, so the best thing to do is to contact one’s academic advisor for steps to submit a course withdraw."
    
    // Segmented Picker: Part 1 of 3
    @State private var pickerSelectedIndex = 0
    
    // Segmented Picker: Part 2 of 3
    let pickerSelectionList = ["1", "2", "3", "4", "5", "6", "7"]
    
    var body: some View {
        Form{
            Section(header: Text("What CLE should I take?")){
                // Segmented Picker: Part 3 of 3
                Picker("CLE", selection: $pickerSelectedIndex) {
                    ForEach(0 ..< pickerSelectionList.count, id: \.self) { index in
                        Text(self.pickerSelectionList[index])
                            .tag(index)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
                area
            }
            
            Section(header: Text("Add/Drop - Adding a class")){
                Group{
                Text("1. Go to hokie spa and click on “Registration (Add/Drop) and Schedule”")
                Image("add1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                
                Text("2. Click “[Drop/Add] Register for Classes” (note this is the page to also view registration information early before Add/Drop opens up)")
                Image("add2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                }
                Group{
                Text("3. Select the term you want to Add/Drop for")
                Image("add3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                
                Text("4. Search for classes to add, view your current schedule, or drop a class you no longer want to take")

                
                Text("5. When dropping a class for another class, it is important to select the Condition Add and Drop button, boxed in red below, without this there is a chance you drop a class, without adding the one you want to add")
                Image("add5")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                
                Text("6. Press Submit when you are done making changes located in the blue box")
                }
            } // End Section
            
            Section(header: Text("Course Withdraw")){
                Text(withdraw)
                .frame(height: 170)
            }
            
            
            
        } //End Form
            .font(.system(size:14))
    }
    
    var area: Text {
        switch pickerSelectedIndex {
        case 0:
            return Text(area1)
        case 1:
            return Text(area2)
        case 2:
            return Text(area3or7)
        case 3:
            return Text(area4)
        case 4:
            return Text(area5)
        case 5:
            return Text(area6)
        case 6:
            return Text(area3or7)
        default:
        fatalError("Selection is out of Range")
        }
    }
}

