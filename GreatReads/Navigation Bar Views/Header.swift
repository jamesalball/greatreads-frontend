//
//  Header.swift
//  Gooder Reads
//
//  Created by James Ball on 8/4/25.
//
import SwiftUI

#Preview {
    
    ContentView()
        .environmentObject(NavigationModel())
    
}

struct Header: View {
    
    @FocusState.Binding var isSearching: Bool
    @EnvironmentObject var navigationModel: NavigationModel
    
    var body: some View {
        
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding()
                
                TextField("", text: $navigationModel.searchText, prompt: Text("Search for books...").foregroundStyle(.white))
                    .padding()
                    .focused($isSearching)
                
            }
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.white, lineWidth: 2)
                    .opacity(0.5)
            )
            
            
            Image(systemName: "bell")
                .resizable()
                .frame(width: 20, height: 20)
                .padding()
            
        }
        .background(.ultraThinMaterial)
        .foregroundStyle(.white)
    }
}
