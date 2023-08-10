//
//  ProfileSummary.swift
//  Books
//
//  Created by Dang Le on 7/8/22.
//

import SwiftUI

struct ProfileSummary: View {
    var profile: Profile
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(profile.username)
                .bold()
                .font(.title)
                .foregroundColor(.brown)
    
            Text("Notifications: \(profile.prefersNotifications ? "On": "Off")")
                .foregroundColor(.accentColor)

            
            Text("Seasonal Photo: \(profile.seasonalPhoto.rawValue)")

            Text("Last Update Date:\(profile.updateDate)")
                .foregroundColor(.secondary)

        }
        
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
    }
}
