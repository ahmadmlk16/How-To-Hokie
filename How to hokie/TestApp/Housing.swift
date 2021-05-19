//
//  Housing.swift
//  TestApp
//
//  Created by Alex Cann on 11/19/19.
//  Copyright © 2019 Alex Cann. All rights reserved.
//

import SwiftUI

struct Housing: View {
    
    let package1 = "Sending packages to those in the dorms is a part of everyday life here at Virginia Tech. Whether you are a student trying to order an Amazon delivery or a student’s parent planning to send them a care package. These are some of the things to know when sending a package.\n\nDeliveries should be addressed thusly:"
    
    let rh = "Residential Halls-\n\nStudent’s full name\nResidential hall name, Rm XXXX\nStreet number and street address\nBlacksburg, VA 24061-(+ four codes are specific to building)"
    
    let inn = "The Inn at Virginia Tech or Holiday Inn-\n\nStudent's full name\nOwens Hall Rm 23\n150 Kent Street\nBlacksburg, VA 24061-1055"
    
    let generalDel = "Adding “Virginia Tech” to the address actually delays your package delivery and should thus be avoided. Packages sent by UPS, FedEx, or DHL will be delivered directly to the student’s room. USPS deliveries concern the following:\n    ·   Package pickup is available at Owens Hall, Room 23 M-F, 8-7 PM\n    ·   Students receiving packages will receive an email once there package is ready for pickup\n    ·   Students must have some form of photo ID to pickup their mail\n    ·   After 30 days without pickup packages are returned to sender\n    ·   Residents at Oak Lane receive there USPS deliveries at special lockers next to the parking lot at Oak Lane"
    
    let dorm = "Living in the dorms can be fun for people coming into this university and is a requirement for freshmen. That being said there are a few rules expected of anyone living there. A few will be listed here but the full handbook can be found at"
    
    let policies = "For those living in residence halls these are the sort of rules they are expected to follow.\n\n    · Personal property left in residence hall after a student’s occupancy term has ended will be considered abandoned and must be retrieved from housekeeping within 1 week or it will be discarded\n  · Most animals are not allowed in the dorm with the exception of approved animals for students with disabilities and 1 aquarium of fish per room such that the aquarium does not exceed 10 gallons\n    · Students cannot use most cooking equipment within the rooms but some approved appliances (such as coffee makers, small microwaves, and refrigerators) can be used in moderation\n    · Likewise flammable material is not to be stored in rooms as well as motorized vehicles. Further approved/restricted items can be found on page 42 of the handbook included in the link above\n    ·     Defined common areas are the responsibility of all the residents to maintain including bathrooms, elevators, lounges, etc. If damages occur to these spaces and an offending party cannot be determined, residents may be billed for the repair.\n    · Virginia Tech is not responsible for any damage  to a resident’s personal property so it may be a good idea to get renter’s insurance\n    · Student’s not satisfied/ in conflict with their roommates or accomodations can request a room change following this procedure: https://www.housing.vt.edu/contracts/Makingchangestocontract/roomchange.html\n    · Smoking is prohibited in all areas of all the residence halls\n    · Visitors and guests also involve a certain alignment with guidelines which are enumerated on page 52 of the included handbook"
    
    var body: some View {
        ScrollView{
            
        VStack{
            Group{
            Text("On Campus Deliveries")
                .font(.system(size: 32))
                .frame(width: UIScreen.main.bounds.width - 10, alignment: .center)
            Text(package1)
                .font(.system(size:12))
                .frame(width: UIScreen.main.bounds.width - 10, height: 100, alignment: .leading)
            Text(rh)
                .font(.system(size:12))
                .frame(width: UIScreen.main.bounds.width - 10, height: 100, alignment: .leading)
            Text(inn)
                .font(.system(size:12))
                .frame(width: UIScreen.main.bounds.width - 10, height: 100, alignment: .leading)
            Text(generalDel)
                .font(.system(size:12))
                .frame(width: UIScreen.main.bounds.width - 10, height: 180, alignment: .leading)
            Divider()
            }   //End Group
            
            
            Text("Dorm Conduct")
                .font(.system(size: 32))
                .frame(width: UIScreen.main.bounds.width - 10, alignment: .center)
            Image("housing1")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(dorm)
                .font(.system(size:12))
                .frame(width: UIScreen.main.bounds.width - 10, height: 100, alignment: .leading)
            Text("Policies")
                .font(.system(size:18))
            Text(policies)
                .font(.system(size:12))
                .frame(width: UIScreen.main.bounds.width - 10, height: 450, alignment: .leading)
        }
            
        }//End ScrollView
    }
}

struct Housing_Previews: PreviewProvider {
    static var previews: some View {
        Housing()
    }
}
