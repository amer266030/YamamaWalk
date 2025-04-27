//
//  ProfileView.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var vm = ProfileVM()
    
    var body: some View {
        VStack (spacing: 32) {
            AsyncImageView(url: URL(string: ""))
            
            VStack(spacing: 8) {
                Text("Profile Picture")
                    .bold()
                Text("Saudi")
            }
            .font(.subheadline)
            
            VStack(spacing: 16) {
                CustomTextField(hint: "", value: .constant("\(vm.user.name ?? "")"), canEdit: false)
                CustomDatePicker(title: "Date of birth", hint: "Please Select", selectedDate: $vm.dob)
                
                SegmentedTabView(selectedTab: $vm.gender)
                
                PrimaryButton(title: "Save", foregroundColor: .appPrimary, backgroundColor: Color.white.gradient) {
                    Task { await vm.updateUser() }
                }
                .frame(width: UIScreen.main.bounds.width/3)
            }
            .padding(40)
            .background(LinearGradient.primary, in: .rect(cornerRadii: .init(topLeading: 8, bottomLeading: 56, bottomTrailing: 56, topTrailing: 8)))
        }
    }
}

#Preview {
    let x = DIContainer.shared
    
    ContentView()
        .onAppear {
            x.navMgr.selectedTab = .profile
            x.navMgr.push(.tabBar)
        }
}
