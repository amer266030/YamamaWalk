//
//  CountDownTimerView.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 23/04/2025.
//

import SwiftUI

struct CountDownTimerView: View {
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Binding var timeRemaining: Int
    var minutesFormat: Bool = false
    var onTimerExpired: ((Int) -> Void)? = nil
    
    var formattedTimeRemaining: String {
        let days = timeRemaining / (24 * 3600)
        let hours = (timeRemaining % (24 * 3600)) / 3600
        let minutes = (timeRemaining % 3600) / 60
//        let seconds = timeRemaining % 60

        if days > 0 {
            return String(format: "%dd %02dh %02dm", days, hours, minutes)
        } else if hours > 0 {
            return String(format: "%02dh %02dm", hours, minutes)
        } else {
            return String(format: "%02dm", minutes)
        }
    }

    
    var body: some View {
        Text("\(formattedTimeRemaining)")
            .onReceive(timer) { _ in
                countDown()
            }
    }
    
    private func stopTimer() {
        timer.upstream.connect().cancel()
    }
    
    func countDown() {
        if timeRemaining > 0 {
            timeRemaining -= 1
        } else {
            stopTimer()
            onTimerExpired?(timeRemaining)
        }
    }
}

#Preview {
    CountDownTimerView(timeRemaining: .constant(360000))
}
