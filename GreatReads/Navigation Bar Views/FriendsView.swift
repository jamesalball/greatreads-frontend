//
//  FriendsView.swift
//  Gooder Reads
//
//  Created by James Ball on 8/4/25.
//

import SwiftUI

#Preview {
    ContentView()
        .environmentObject(NavigationModel())
}

struct FriendsView: View {
    
    @EnvironmentObject var navigationModel: NavigationModel
    @FocusState.Binding var isSearching: Bool
    
    private let postList: [Post]
    
    init(isSearching: FocusState<Bool>.Binding) {
        self._isSearching = isSearching
        
        let jsonString = #"""
        [
            {
                "id": "1",
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
                "userName": "Baby Angel",
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
                "userName": "cheezman 99",
                "postType": "review",
                "book": {
                    "id": "2",
                    "title": "The Stand",
                    "author": "Stephen King",
                    "description": "It's a long story, but it's true.",
                    "avgRating": 4.2
                },
                "reviewRating": 4.0,
                "reviewText": "crunch bird"
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
                "reviewText": "This book sucks ass!"
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
