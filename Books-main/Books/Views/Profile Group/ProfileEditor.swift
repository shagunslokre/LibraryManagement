//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by Dang Le on 7/22/22.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var body: some View {
        List {
            HStack{
                Text("User Name: ")
                    .bold()
                Divider()
                TextField("User Name: ", text: $profile.username)
                    .foregroundColor(.brown)

            }
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notification")
                    .bold()
                    .foregroundColor(.accentColor)

            }
            
            VStack {
                Text("Seasonal Photo")
                Picker("Seasonal Photo", selection: $profile.seasonalPhoto)
                {
                    ForEach(Profile.Season.allCases) {
                        season in Text(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(.segmented)
                
            }
            DatePicker(selection: $profile.updateDate, displayedComponents: .date )
            {
                Text("Last Update Date")
                    .bold()
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
