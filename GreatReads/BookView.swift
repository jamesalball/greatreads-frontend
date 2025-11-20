//
//  BookPage.swift
//  Gooder Reads
//
//  Created by James Ball on 8/7/25.
//

import SwiftUI

//Rendering for the Xcode preview panel.
#Preview {
    ContentView()
        .environmentObject(NavigationModel())
}

//A struct that shows the details of a Book (author, summary, reviews, etc.)
struct BookView: View {
    
    @EnvironmentObject var navigationModel: NavigationModel
    
    let book: Book
    
    var body: some View {
        
        ZStack {
            
            ScrollView {
                
                //The Book's cover, title, and author.
                VStack(spacing: 20) {
                    
                    Spacer()
                        .frame(height: 200)
                    
                    VStack {
                        
                        Image(systemName: "book.closed")
                            .resizable()
                            .frame(width: 140, height: 200)
                            .border(Color.white)
                        
                        Text(book.title)
                            .font(.title)
                        
                        Text("by " + book.author)
                        
                    }
                    
                    //The Book's rating, number of ratins, and number of reviews.
                    HStack {
                        
                        Spacer()
                        RatingStars(avgRating: book.avgRating, starSize: 15)
                        Spacer()
                            .frame(width: 5)
                        
                        Text(String(book.avgRating))
                            .font(.caption)
                        
                        Spacer()
                        Text("•")
                        Spacer()
                        
                        Text("12,000 ratings")
                            .font(.caption)
                        
                        Spacer()
                        Text("•")
                        Spacer()
                        
                        Text("6,000 reviews")
                            .font(.caption)
                        Spacer()
                        
                    }
                    .padding()
                    
                    //Add to TBR button.
                    Button {
                        
                    } label: {
                        Text("Add to TBR")
                    }
                    .frame(width: 200, height: 35)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .opacity(0.4)
                            .foregroundStyle(Color.pink)
                    )
                    
                    //Allow the user to rate the book.
                    VStack {
                        Text("Rate this book:")
                            .font(.subheadline)
                            .opacity(0.6)
                        InputRatingStars()
                    }
                    
                    //The book summary.
                    VStack {
                        Text("Book Description")
                            .font(.headline)
                            .underline()
                            .bold()
                        
                        Spacer()
                            .frame(height: 10)
                        
                        HStack {
                            Spacer()
                                .frame(width: 10)
                            Text(book.description)
                                .font(.subheadline)
                                .padding()
                                .border(Color.white, width: 1)
                            Spacer()
                                .frame(width: 10)
                        }
                        
                    }
                    
                    //User reviews for the Book.
                    VStack(spacing: 20) {
                        
                        HStack {
                            
                            Spacer()
                                .frame(width: 10)
                            Text("User Reviews")
                                .font(.headline)
                                .bold()
                                .underline()
                            
                            Spacer()
                            
                        }
                        
                        ReviewPreviewCard(displayName: "Friend 1", rating: 1.5, reviewText: "This is bad!", numLikes: 43, numComments: 142)
                        
                        ReviewPreviewCard(displayName: "James Ball", rating: 5.0, reviewText: "This book rocks!", numLikes: 122, numComments: 32)
                        
                        ReviewPreviewCard(displayName: "Friend 3", rating: 3.5, reviewText: "It's good!", numLikes: 9999, numComments: 9999)
                        
                        Button {
                            
                        } label: {
                            
                            HStack {
                                
                                Text("See more reviews")
                                    .bold()
                                Spacer()
                                Image(systemName: "chevron.right")
                                Spacer()
                                    .frame(width: 10)
                                
                            }
                        }
                    }
                    
                    Spacer()
                        .frame(height: 60)
                    
                }
                .padding()
            }
            
            VStack {
                
                Spacer()
                    .frame(height: 60)
                
                HStack {
                    
                    Button {
                        navigationModel.path.removeLast()
                    } label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .frame(width: 20, height: 30)
                    }
                    
                    Spacer()
                    
                }
                
                Spacer()
                
            }
            .padding()
        }
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Gradient(colors: gradientColors))
        .navigationBarBackButtonHidden(true)
    }
    
}


