//
//  ReviewCard.swift
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

//An enum specifying the different types of Posts.
enum PostType: String, Codable {
    case review = "review"
    case pageReached = "pageReached"
    case like = "like"
    case comment = "comment"
}


/*A struct that shows a Post "card."
 Posts include reviews, comments, likes, and more from friends.*/
struct PostCard: View {
    
    @EnvironmentObject var navigationModel: NavigationModel
    
    let post: Post
    
    var body: some View {
        
        let book = post.book ?? Book(id: "0", title: "", author: "" , description: "", avgRating: 0.0)
        
        VStack {
            
            //Specifying content for "review" Posts.
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
            
            //Specifying content for "page reached" Posts.
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
            
            
            //Each post has Like/Comment buttons beneath it.
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
