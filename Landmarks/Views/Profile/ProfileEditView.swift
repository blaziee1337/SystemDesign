//
//  ProfileEditView.swift
//  Landmarks
//
//  Created by Halil Yavuz on 08.07.2024.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

struct ProfileEditView: View {
    @Binding var profile: Profile
      
      var body: some View {
          List {
              HStack() {
                  TextField("Enter your name", text: $profile.username)
              }
              
              Toggle(isOn: $profile.prefersNotifications) {
                  Text("Enable Notifications").bold()
              }
              
              VStack(alignment: .leading, spacing: 20) {
                  Text("Seasonal Photo").bold()
                  
                  Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                      ForEach(Profile.Season.allCases) { season in
                          Text(season.rawValue).tag(season)
                      }
                  }
                  .pickerStyle(SegmentedPickerStyle())
              }
              .padding(.bottom, 10)
              
              DatePicker(selection: $profile.goalDate, displayedComponents: .date) {
                  Text("Goal Date").bold()
                  
              }
             
          }
          .environment(\.defaultMinListRowHeight, 55)
          .navigationBarBackButtonHidden()
          .padding()
      }
  }

#Preview {
    ProfileEditView(profile: .constant(.default))
}

