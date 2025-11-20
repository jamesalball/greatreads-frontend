//
//  FriendsView.swift
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

//A struct for a feed showing friend activity (Posts).
struct FriendsView: View {
    
    @EnvironmentObject var navigationModel: NavigationModel
    @FocusState.Binding var isSearching: Bool
    
    private let postList: [Post]
    
    init(isSearching: FocusState<Bool>.Binding) {
        self._isSearching = isSearching
        
        //An example JSON string from the API.
        let jsonString = #"""
        [
            {
                "id": "1",
                "userName": "Friend 1",
                "postType": "review",
                "book": {
                    "id": "2",
                    "title": "The Stand",
                    "author": "Stephen King",
                    "description": "It's a long story, but it's true.",
                    "avgRating": 4.2
                },
                "reviewRating": 1.5,
                "reviewText": "This book sucks ass!"
            },
        
            {
                "id": "2",
                "userName": "James Ball",
                "postType": "review",
                "book": {
                    "id": "2",
                    "title": "The Stand",
                    "author": "Stephen King",
                    "description": "It's a long story, but it's true.",
                    "avgRating": 4.2
                },
                "reviewRating": 5.0,
                "reviewText": "This book rocks!"
            },

            {
                "id": "3",
                "userName": "Friend 2",
                "postType": "review",
                "book": {
                    "id": "2",
                    "title": "The Stand",
                    "author": "Stephen King",
                    "description": "It's a long story, but it's true.",
                    "avgRating": 4.2
                },
                "reviewRating": 3.5,
                "reviewText": "Mrow?"
            },

            {
                "id": "4",
                "userName": "Friend 3",
                "postType": "review",
                "book": {
                    "id": "2",
                    "title": "The Stand",
                    "author": "Stephen King",
                    "description": "It's a long story, but it's true.",
                    "avgRating": 4.2
                },
                "reviewRating": 4.0,
                "reviewText": "It's good!"
            },

            {
                "id": "5",
                "userName": "Sadira Austin",
                "postType": "review",
                "book": {
                    "id": "2",
                    "title": "The Stand",
                    "author": "Stephen King",
                    "description": "It's a long story, but it's true.",
                    "avgRating": 4.2
                },
                "reviewRating": 1.5,
                "reviewText": "This book is bad!"
            },
        ]
        """#
        
        guard let jsonData = jsonString.data(using: .utf8) else {
            fatalError("Failed to convert string to data.")
        }
        
        let decoder = JSONDecoder()
        
        do {
            self.postList = try decoder.decode([Post].self, from: jsonData)
        } catch {
            self.postList = []
            print("Error decoding JSON: \(error)")
        }
    }
    
    //The feed itself is a ScrollView containing several Posts.
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ForEach(postList) { post in
                    PostCard(post: post)
                        .environmentObject(navigationModel)
                }
            }
            .padding()
        }
        .onScrollGeometryChange(for: CGFloat.self, of: { geometry in
            geometry.contentOffset.y
        }) { oldOffset, newOffset in
            isSearching = false
        }
    }
}
