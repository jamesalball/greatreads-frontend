//
//  SearchResultsView.swift
//  Gooder Reads
//
//  Created by James Ball on 8/11/25.
//

import SwiftUI

#Preview {
    ContentView()
        .environmentObject(NavigationModel())
}

struct SearchResultsView: View {
    
    @EnvironmentObject var navigationModel: NavigationModel
    @FocusState.Binding var isSearching: Bool
    @State private var hasLoaded = false
    
    var body: some View {
        
        ScrollView {
            VStack {
                Spacer()
                    .frame(height: 60)
                
                VStack {
                    Text("Searching for \(navigationModel.searchText)...")
                }
                
                Spacer()
                
            }
        }
        .onAppear {
            hasLoaded = true
        }
        .onScrollGeometryChange(for: CGFloat.self, of: { geometry in
            geometry.contentOffset.y
        }) { oldOffset, newOffset in
            if hasLoaded {
                isSearching = false
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
    
}
