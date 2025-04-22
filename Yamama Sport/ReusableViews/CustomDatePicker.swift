//
//  CustomDatePicker.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import SwiftUI

struct CustomDatePicker: View {
    var title: LocalizedStringKey
    var hint: LocalizedStringKey
    @Binding var selectedDate: Date
    
    var body: some View {
        HStack {
            Text(selectedDate.formatted(date: .abbreviated, time: .omitted))
                .foregroundStyle(.appPrimary)
                .font(.footnote)
                .fontWeight(.bold)
            Spacer()
            Image(systemName: "calendar")
                .foregroundStyle(.black)
              .font(.title3)
              .overlay{
                 DatePicker(
                     "",
                     selection: $selectedDate,
                     displayedComponents: [.date]
                 )
                  .blendMode(.destinationOver)
                  .allowsHitTesting(true)
              }
        }
        .padding(16)
        .background(.white, in: .rect(cornerRadius: 8))
    }
}

#Preview {
    CustomDatePicker(title: "Date of birth", hint: "Please Select", selectedDate: .constant(Date.now))
        .preferredColorScheme(.dark)
}
