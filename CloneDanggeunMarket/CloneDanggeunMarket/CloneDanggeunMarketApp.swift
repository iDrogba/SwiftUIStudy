//
//  CloneDanggeunMarketApp.swift
//  CloneDanggeunMarket
//
//  Created by κΉμν on 2022/03/05.
//

import SwiftUI

@main
struct CloneDanggeunMarketApp: App {
    var body: some Scene {
        WindowGroup {
            let homeView_ViewModel = HomeView_ViewModel()
            ContentView()
                .environmentObject(homeView_ViewModel)
        }
    }
}
