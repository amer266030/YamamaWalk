//
//  SegmentedTabView.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import SwiftUI

// Note: Pass an enum that conforms to the protocol

struct SegmentedTabView<T: TabItemProtocol>: View {
    @Binding var selectedTab: T
    var font: Font = .subheadline

    var body: some View {
        HStack {
            ForEach(T.allCases) { tab in
                Button {
                    withAnimation(.smooth(duration: 0.3)) {
                        selectedTab = tab
                    }
                } label: {
                    let isSelected = tab == selectedTab
                    Text(tab.strValue)
                        .font(font)
                        .fontWeight(.semibold)
                        .lineLimit(1)
                        .minimumScaleFactor(0.75)
                        .foregroundStyle(isSelected ? .appPrimary : .white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background {
                            if isSelected {
                                Capsule()
                                    .fill(.white)
                            } else {
                                Capsule()
                                    .stroke(.white, lineWidth: 1)
                            }
                            
                        }
                }
            }
        }
    }
}

#Preview {
    SegmentedTabView(selectedTab: .constant(Gender.male))
}
