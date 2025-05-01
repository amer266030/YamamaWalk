//
//  RankingVM.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 22/04/2025.
//

import Foundation

class RankingVM: ObservableObject {
    private let x = DIContainer.shared
    
    @Published var timeRemaining = 36000
    @Published var rankList: [UserRanking] = []
    
    @MainActor
    func getRanking() async {
        x.popupMgr.showLoading()
        defer { x.popupMgr.dismissLoading() }
        
        let queryParams = [URLQueryItem(name: StepsQueryParam.eventId.rawValue, value: "1")]
        
        do {
            let response: GetRankingResponse = try await StepsAPI.sendRequest(to: .getRanking, body: EmptyBody(), with: queryParams)
            self.rankList = response.sorted(by: { ($0.rank ?? Int.max) < ($1.rank ?? Int.max) })
            
        } catch let error as NetworkError {
            if error == NetworkError.simulatorError {  } else {
                x.popupMgr.showAppAlert(for: AppAlert.httpError(error))
            }
        } catch {
            x.popupMgr.showAppAlert(for: AppAlert.unexpected(error))
        }
    }
}
