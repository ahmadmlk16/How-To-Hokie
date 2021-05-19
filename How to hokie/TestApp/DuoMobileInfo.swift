//
//  DuoMobileInfo.swift
//  TestApp
//
//  Created by Alex Cann on 12/9/19.
//  Copyright © 2019 Alex Cann. All rights reserved.
//

import SwiftUI

struct DuoMobileInfo: View {
    
    let textField1 = "Duo is a 2 factor authentication system VT uses to allow students access to their services and systems alongside their passwords. It involves sending a request to an approved device which confirms your identity. While setup instructions for each student is usually done during orientation the following are some other things you may need to do with Duo. Every device you use to connect to Virginia Tech’s services must be authenticated by a connected device authorized by Duo."
    
    let textField2 = "After signing in with your username and password the following screen will show up:"
    
    let textField3 = "Choosing any of the other options allow you to utilize other authentication methods:\n\n    ·      Call Me – Sends a call to your connected device, which you can answer and follow to authenticate your account\n    ·      Passcode – This allows you to enter a passcode produced by your connected device’s Duo App\n    ·      Duo Push – This is the standard method which sends a notification to your connected device that you can confirm from the app\n\nOn this menu you can also choose for your device to remain authenticated for the next 7 days if you ever get annoyed by the repeated requests. From here you can click “My Settings and Devices” to do the following:"
    
    let textField4 = "Do the following to add new devices you can use to authenticate a login to VT services.\n\n    1.    Press add a new device and choose the device you wish to use\n    2.    Follow the instructions for authentication (usually sending a code or calling the added device)\n    3.    After you have verified your device press submit to finish adding your new device\n\nOn the same menu you can determine your default device to use to authenticate and what sort of method you would like to use (call, passcode, or push)"
    
    let textField5 = "On the settings menu you can do the following to remove a authenticating device from Duo:\n\n    1.    Click on device options next to the device you wish to remove\n    2.    Click the trash can icon\n    3.    Click the remove button in the new pop-up window to confirm removal"
    
    var body: some View {
        Form {
            Section(header: Text("General Info")) {
                Text(verbatim: textField1)
                .frame(height: 155)
            }
            
            Section(header: Text("Log In Page")) {
                Image("duo1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            Section(header: Text("Duo Request")) {
                Text(verbatim: textField2)
                Image("duo2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Section(header: Text("Using Other Methods to Authenticate")) {
                Text(verbatim: textField3)
                Image("duo3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Section(header: Text("Adding a Device")) {
                Text(verbatim: textField4)
            }
            Section(header: Text("Removing a Device")) {
                Text(verbatim: textField5)
            }
            
        } // End Form
            .font(.system(size: 14))
        
    }
}

struct DuoMobileInfo_Previews: PreviewProvider {
    static var previews: some View {
        DuoMobileInfo()
    }
}
