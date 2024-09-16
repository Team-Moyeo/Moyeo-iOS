//
//  moyeoApp.swift
//  moyeo
//
//  Created by kyungsoolee on 9/2/24.
//

import SwiftUI

@main
struct moyeoApp: App {
    
    @State private var tempIsLoginComplete: Bool = false
    @State private var pathModel: PathModel = .init()
    
    var body: some Scene {
        WindowGroup {
//            // TODO: true자리에 authUseCase.state.isLoginComplete로 자동 로그인 되게끔
//            if !tempIsLoginComplete {
//                LoginView(tempIsLoginComplete: $tempIsLoginComplete)
//            } else {
//                MainView()
//            }
            GroupTimeVoteView(meeting: MockDataBuilder.meeting)
        }
        .environment(pathModel)
    }
}
