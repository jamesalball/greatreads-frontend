//
//  ReviewPreviewCard.swift
//  GreatReads
//
//  Created by James Ball on 8/11/25.
//

//Rendering for the Xcode preview panel.
#Preview {
    
    ContentView()
        .environmentObject(NavigationModel())
    
}

import SwiftUI

//A struct for a Review Preview "card." These appear on a Book's detail page.
struct ReviewPreviewCard: View {
    
    let displayName: String
    let rating: Double
    let reviewText: String
    let numLikes: Int
    let numComments: Int
    
    var body: some View {
        
        VStack(spacing: 15){
            
            //The top line of the review ("James gave 2 stars")
            HStack {
                
                Spacer()
                    .frame(width: 15)
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 30, maxHeight: 30)
                
                Text("\(displayName) gave")
                    .font(.subheadline)
                
                RatingStars(avgRating: rating, starSize: 15)
                
                Spacer()
                
            }
            
            //The review preview text
            HStack {
                
                Spacer()
                    .frame(width: 55)
                
                Text(reviewText)
                    .font(.subheadline)
                
                Spacer()
                
            }
            
            //Like and Comment buttones
            HStack {
                
                Button {
                    
                } label: {
                    Text("Like")
                }
                
                Text("•")
                
                Button {
                    
                } label : {
                    Text("Comment")
                }
                
                Text("•")
                
                Image(systemName: "hand.thumbsup.fill")
                Text(String(numLikes))
                
                Text("•")
                
                Image(systemName: "bubble.fill")
                Text(String(numComments))
                
            }
            
            Spacer()
                .frame(height: 5)
            
        }
        .overlay(
            Rectangle()
                .frame(height: 1) // For a bottom border
                .foregroundColor(.white),
            alignment: .bottom // Adjust alignment for different sides
        )
    }
}
