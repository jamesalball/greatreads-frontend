//
//  RatingStars.swift
//  Gooder Reads
//
//  Created by James Ball on 8/11/25.
//


import SwiftUI

struct RatingStars: View {
    
    let avgRating: Double
    let starSize: CGFloat
    
    var body: some View {
        
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