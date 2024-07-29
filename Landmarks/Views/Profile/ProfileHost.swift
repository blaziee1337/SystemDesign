//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Mac on 6/29/24.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

import SwiftUI

struct ProfileHost: View {
    @State private var draftProfile = Profile.default
    @Environment(\.dismiss) private var dismiss
    @Environment(\.editMode) private var editMode
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                cancelButton
                Spacer()
                EditButton()
                    .padding(.trailing)
            }
            
            Group {
                if editMode?.wrappedValue == .active {
                    ProfileEditView(profile: $draftProfile)
                        .onDisappear {
                            modelData.profile = draftProfile
                            
                        }
                } else {
                    ProfileSummary(profile: modelData.profile)
                }
            }
            .transition(.moveAndFade)
            
            Spacer()
        }
        .padding()
        .navigationBarBackButtonHidden()
        .onAppear {
            draftProfile = modelData.profile
        }
    }
    
    private var cancelButton: some View {
        Button(action: {
            withAnimation {
                if editMode?.wrappedValue == .active {
                    editMode?.wrappedValue = .inactive
                    modelData.profile = draftProfile
                } else {
                    dismiss()
                }
            }
            
        }) {
            if editMode?.wrappedValue == .active {
                Text("Cancel")
                    .padding(.leading)
            } else {
                HStack {
                    Image(systemName: "chevron.left")
                    Text("Featured")
                }
            }
        }
    }
}

#Preview {
    ProfileHost()
        .environment(ModelData())
}
