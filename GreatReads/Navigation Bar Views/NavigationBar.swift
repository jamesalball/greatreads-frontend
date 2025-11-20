//
//  NavigationBar.swift
//  GreatReads
//
//  Created by James Ball on 8/4/25.
//

import SwiftUI


//Rendering for the Xcode preview panel.
#Preview {
    
    ContentView()
        .environmentObject(NavigationModel())
    
}


//A struct to contain the navigation bar logic, allowing the user to switch tabs.
struct NavigationBar: View {
    
    @EnvironmentObject var navigationModel: NavigationModel
    
    var body: some View {
        
        HStack(spacing: 25){
            
            //Button for the "Home" tab.
            Button {
                
                navigationModel.tabChoice = .home
                navigationModel.path = NavigationPath()
                navigationModel.searchText = ""
                
            } label: {
                
                VStack {
                    
                    if navigationModel.tabChoice == .home {
                        Image(systemName: "house.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:20, height: 20)
                    } else {
                        Image(systemName: "house")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:20, height: 20)
                    }
                    
                    Text("Home")
                        .font(.caption)
                    
                }
                .padding(.trailing, 10)
            }
            
            //Button for the "My Books" tab.
            Button {
                
                navigationModel.tabChoice = .myBooks
                navigationModel.path = NavigationPath()
                navigationModel.searchText = ""
                
            } label: {
                
                VStack {
                    
                    if navigationModel.tabChoice == .myBooks {
                        Image(systemName: "books.vertical.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:20, height: 20)
                    } else {
                        Image(systemName: "books.vertical")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:20, height: 20)
                    }
                    
                    Text("My Books")
                        .font(.caption)
                    
                }
                .padding(.trailing, 10)
            }
            
            //Button for the "Friends" tab.
            Button {
                
                navigationModel.tabChoice = .friends
                navigationModel.path = NavigationPath()
                navigationModel.searchText = ""
                
            } label: {
                
                VStack {
                    
                    if navigationModel.tabChoice == .friends {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:20, height: 20)
                    } else {
                        Image(systemName: "heart")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:20, height: 20)
                    }
                    
                    Text("Friends")
                        .font(.caption)
                    
                }
                .padding(.trailing, 10)
                
            }
            
            //Button for the "Search" tab.
            Button {
                
                navigationModel.tabChoice = .search
                navigationModel.path = NavigationPath()
                navigationModel.searchText = ""
                
            } label: {
                
                VStack {
                    
                    if navigationModel.tabChoice == .search {
                        Image(systemName: "magnifyingglass.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:20, height: 20)
                    } else {
                        Image(systemName: "magnifyingglass.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:20, height: 20)
                    }
                    
                    Text("Search")
                        .font(.caption)
                    
                }
                .padding(.trailing, 10)
                
            }
            
            //Button for the "Profile" tab.
            Button {
                
                navigationModel.tabChoice = .profile
                navigationModel.path = NavigationPath()
                navigationModel.searchText = ""
                
            } label: {
                
                VStack {
                    
                    if navigationModel.tabChoice == .profile {
                        Image(systemName: "person.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:20, height: 20)
                    } else {
                        Image(systemName: "person")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:20, height: 20)
                    }
                    
                    Text("Profile")
                        .font(.caption)
                    
                }
                .padding(.trailing, 10)
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 60)
        .padding(.top, 10)
        .background(.ultraThinMaterial)
        .foregroundStyle(.white)
        
    }
}
