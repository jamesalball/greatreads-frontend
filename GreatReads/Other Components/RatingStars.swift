//
//  RatingStars.swift
//  GreatReads
//
//  Created by James Ball on 8/11/25.
//


import SwiftUI

//A struct to display a Book's rating as a partially-filled-in set of 5 stars. Used on the Book card.
struct RatingStars: View {
    
    let avgRating: Double
    let starSize: CGFloat
    
    var body: some View {
        
        /*There are really two sets of stars, one transparent, and one filled in. The filled-in one is
        cut off according to the Book's rating.*/
        ZStack {
            
            HStack(spacing: 0) {
                
                ForEach(0..<5) { index in
                    Image(systemName: "star")
                        .resizable()
                        .frame(width: starSize, height: starSize)
                        //.border(Color.white, width: 1)
                }
                
            }
            
            HStack(spacing: 0) {
                
                //Determine how filled-in the stars should be.
                ForEach (0..<5) { index in
                    let diff = avgRating - Double(index)
                    
                    if avgRating >= Double(index + 1) {
                        
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: starSize, height: starSize)
                        
                    } else if diff < 1.0 && diff > 0.0 {
                        
                        let partialStarWidth = starSize * diff
                        let spacerWidth = starSize - partialStarWidth
                        
                        Image(systemName: "star.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: partialStarWidth, height: starSize, alignment: .leading)
                            .clipped()
                        
                        Spacer()
                            .frame(width: spacerWidth)
                        
                    } else {
                        
                        Spacer()
                            .frame(width: starSize)
                        
                    }
                }
            }
        }
    }
}
