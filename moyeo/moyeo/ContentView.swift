//
//  ContentView.swift
//  moyeo
//
//  Created by kyungsoolee on 9/2/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var coordinator: Coordinator = Coordinator.shared
    
    var body: some View {
        ZStack {
            VStack {
                NaverMap()
                    .ignoresSafeArea(.all, edges: .top)
            }
            Spacer()

        }
        .onAppear {
            Coordinator.shared.checkIfLocationServiceIsEnabled()
            Task {
                Coordinator.shared.setMarker(lat: 36.01409963351347, lng: 129.32589654830747)
            }
        }
    }
}

#Preview {
    ContentView()
}
