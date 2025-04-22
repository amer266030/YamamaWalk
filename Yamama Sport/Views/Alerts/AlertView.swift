//
//  AlertView.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import SwiftUI

struct AlertView: View {
    @ObservedObject var popupMgr = PopupMgr.shared
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            
            HStack {
                Spacer()
                if popupMgr.alertCanBeDismissed {
                    Button {
                        popupMgr.dismissAppAlert()
                    } label: {
                        Image(systemName: "x.circle.fill")
                            .font(.title3)
                            .foregroundStyle(.blue)
                    }
                }
            }
            .padding()
            
            VStack(alignment: .leading, spacing: 24) {
                
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Image(systemName: "info.square")
                            .foregroundStyle(popupMgr.alertIconColor)
                        
                        Text(popupMgr.alertTitle)
                            .foregroundStyle(.text)
                            .fontWeight(.medium)
                        Spacer()
                    }
                    .font(.caption)
                    
                    Text(popupMgr.alertMsg)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .lineLimit(6)
                        .minimumScaleFactor(0.5)
                }
                
                HStack {
                    if let secondaryTitle = popupMgr.alertSecondaryBtnTitle {
                        SecondaryButton(
                            title: "\(secondaryTitle)") {
                                if let action = popupMgr.alertSecondaryBtnAction {
                                    action()
                                }
                                if popupMgr.alertCanBeDismissed { popupMgr.dismissAppAlert() }
                            }
                    }
                    
                    PrimaryButton(
                        title: "\(popupMgr.alertPrimaryBtnTitle ?? "OK")") {
                            if let action = popupMgr.alertPrimaryBtnAction {
                                action()
                            }
                            if popupMgr.alertCanBeDismissed { popupMgr.dismissAppAlert() }
                        }
                }
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 32)
        }
        .background(Color.bg.gradient, in: .rect(cornerRadius: 24))
        .padding(.horizontal, 32)
    }
}

#Preview {
    let popupMgr = PopupMgr.shared
    
    ZStack {
        ContainerRelativeShape()
            .fill(Color.appPrimary.gradient)
            .ignoresSafeArea()
        
        AlertView()
            .onAppear {
                popupMgr.alertTitle = "Error!"
                popupMgr.alertMsg = "There seems to be a problem. Please try later"
                popupMgr.alertPrimaryBtnTitle = "Continue"
//                popupMgr.alertSecondaryBtnTitle = "NO"
            }
    }
}
