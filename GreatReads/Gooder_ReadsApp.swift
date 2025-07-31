//
//  Gooder_ReadsApp.swift
//  Gooder Reads
//
//  Created by James Ball on 7/31/25.
//

import SwiftUI

#Preview {
    
    ContentView()
        .environmentObject(NavigationModel())
    
}

let gradientColors: [Color] = [
    .gradientTop,
    .nightSkyBlue
]

enum SelectedTab {
    case home
    case myBooks
    case friends
    case search
    case profile
}

class NavigationModel: ObservableObject {
    @Published var tabChoice: SelectedTab = .myBooks
    @Published var path: NavigationPath = NavigationPath()
    @Published var searchText: String = ""
}

@main
struct Gooder_ReadsApp: App {
    
    @StateObject var navigationModel = NavigationModel()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(navigationModel)
        }
    }
}
