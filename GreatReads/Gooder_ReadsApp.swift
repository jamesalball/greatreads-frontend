//
//  Gooder_ReadsApp.swift
//  GreatReads
//
//  Created by James Ball on 7/31/25.
//

import SwiftUI

//Rendering for the Xcode preview panel.
#Preview {
    
    ContentView()
        .environmentObject(NavigationModel())
    
}

//Background colors
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

//A model to keep manage the User's navigation.
class NavigationModel: ObservableObject {
    @Published var tabChoice: SelectedTab = .myBooks
    @Published var path: NavigationPath = NavigationPath()
    @Published var searchText: String = ""
}


//The main struct.
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
