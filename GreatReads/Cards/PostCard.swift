//
//  ReviewCard.swift
//  Gooder Reads
//
//  Created by James Ball on 8/4/25.
//
import SwiftUI

#Preview {
    /*let pathState = PathModel()
    
    ReviewCard(title: "The Stand", author: "Stephen King", description: "It's a post-apocalypse!", friendName: "Sadira Austin", postType: .review, reviewRating: 4.9)
    
    ReviewCard(title: "The Stand", author: "Stephen King", description: "It's a post-apocalypse!", friendName: "Sadira Austin", postType: .pageReached, page: 50, totalPages: 1200)*/
    
    ContentView()
        .environmentObject(NavigationModel())
    
}

enum PostType: String, Codable {
    case review = "review"
    case pageReached = "pageReached"
    case like = "like"
    case comment = "comment"
}

struct PostCard: View {
    @EnvironmentObject var navigationModel: NavigationModel
    
    let post: Post
    
    var body: some View {
        
        let book = post.book ?? Book(id: "0", title: "", author: "" , description: "", avgRating: 0.0)
        
        VStack {
            if post.postType == .review {
                let formattedRating = String(format: "%.1f", post.reviewRating ?? 0)
                
                
                Text("\(post.userName) gave \(formattedRating) stars to \(book.title)")
                    .font(.subheadline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .background(
                        Rectangle()
                            .foregroundStyle(Color.pink)
                            .opacity(0.4)
                    )
                    .padding(.bottom, -8)
                
                
                BookCard(book: book)
                    .environmentObject(navigationModel)
            }
            
            if post.postType == .pageReached {
                let formattedPage = String(format: "%f", post.page ?? 0)
                let formattedTotalPages = String(format: "%f", post.totalPages ?? 0)
                Text("\(post.userName) reached page \(formattedPage) of \(formattedTotalPages) in \(book.title)")
                    .font(.subheadline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .background(
                        Rectangle()
                            .foregroundStyle(Color.pink)
                            .opacity(0.4)
                    )
                    .padding(.bottom, -8)
                
                
                BookCard(book: book)
                    .environmentObject(navigationModel)
            }
            
            
            
            HStack {
                Button {
                    //like action
                } label : {
                    VStack {
                        Image(systemName:"hand.thumbsup")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:20, height: 20)
                        Text("Like")
                            .font(.caption)
                    }
                }
                
                Spacer()
                    .frame(width: 50)
                
                Button {
                    //comment action
                } label : {
                    VStack {
                        Image(systemName:"bubble")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:20, height: 20)
                        Text("Comment")
                            .font(.caption)
                    }
                }
            }
            .foregroundStyle(Color.white)
            .frame(maxWidth: .infinity, minHeight: 50)
            .background(
                Rectangle()
                    .foregroundStyle(.gray)
                    .opacity(0.4)
                    .brightness(-0.4)
                    
            )
            .padding(.top, -8)
        }
        
    }
}
