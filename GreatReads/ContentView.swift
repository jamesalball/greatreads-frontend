//
//  ContentView.swift
//  Gooder Reads
//
//  Created by James Ball on 8/4/25.
//

import SwiftUI

#Preview {
    ContentView()
        .environmentObject(NavigationModel())
}

enum Destination: Hashable {
    case bookView(book: Book)
}

struct ContentView: View {
    
    @EnvironmentObject var navigationModel: NavigationModel
    @FocusState var isSearching: Bool
    
    private var initData: String = ""
    
    init() {
        self.initData = #"""
            {
                "friendsActivity": 
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
                    ],
            "recentSearches":
                [
                    {
                        "id": "1",
                        "title": "Pet Semetary",
                        "author": "Stephen King",
                        "description": "It's a long story, but it's true.",
                        "avgRating": 4.5
                    },
                    
                    {
                        "id": "2",
                        "title": "The Stand",
                        "author": "Stephen King",
                        "description": "It's a long story, but it's true.",
                        "avgRating": 4.2
                    },
                    
                    {
                        "id": "3",
                        "title": "IT",
                        "author": "Stephen King",
                        "description": "It's a long story, but it's true.",
                        "avgRating": 4.8
                    },
                    
                    {
                        "id": "4",
                        "title": "The Shining",
                        "author": "Stephen King",
                        "description": "It's a long story, but it's true.",
                        "avgRating": 3.9
                    },
                    
                    {
                        "id": "5",
                        "title": "Carrie",
                        "author": "Stephen King",
                        "description": "It's a long story, but it's true.",
                        "avgRating": 3.2
                    }
                ],
            "myBooks": {
                    "read": [
                    ],
                    "TBR": [
                    ],
                    "currentlyReading": [
                    ],
                    "custom": [
                    ]
                }
            }
            """#
    }
    
    var body: some View {
        
        NavigationStack(path: $navigationModel.path) {
            VStack {
                Spacer()
                    .frame(height: 50)
                
                if navigationModel.searchText != "" || isSearching {
                    SearchResultsView(isSearching: $isSearching)
                        .environmentObject(navigationModel)
                }
                
                else if navigationModel.tabChoice == .friends {
                    FriendsView(isSearching: $isSearching)
                        .environmentObject(navigationModel)
                }
                
                else if navigationModel.tabChoice == .search {
                    RecentSearchesView(isSearching: $isSearching)
                        .environmentObject(navigationModel)
                }
                
                else if navigationModel.tabChoice == .myBooks {
                    MyBooksView(isSearching: $isSearching)
                        .environmentObject(navigationModel)
                }
                
                else if !isSearching {
                    Spacer()
                        .frame(height: 60)
                }
                
                Spacer()
                    .frame(height: 60)
                
            }
            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                case .bookView(let book):
                    BookView(book: book)
                }
            }
            .frame(maxHeight: .infinity)
            .background(Gradient(colors: gradientColors))
            .foregroundStyle(.white)
        }
        .safeAreaInset(edge: .bottom) {
            if !isSearching {
                NavigationBar()
                    .environmentObject(navigationModel)
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .safeAreaInset(edge: .top) {
            Header(isSearching: $isSearching)
                .environmentObject(navigationModel)
        }
    }
}
