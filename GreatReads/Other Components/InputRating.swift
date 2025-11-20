//
//  TestView.swift
//  GreatReads
//
//  Created by James Ball on 8/8/25.
//

import SwiftUI

//Rendering for the Xcode preview panel.
#Preview {
    InputRatingStars()
}

//A struct to allow the user to rate a Book by dragging or tapping five stars.
struct InputRatingStars: View {
    
    @State private var value = 0.0
    @State private var isEditing = false

    var body: some View {
        
        ZStack {
            
            RatingStars(avgRating: value, starSize: 30)
            CustomSlider(value: $value, range: 0...5)
                .frame(width: 150)
                .opacity(0.1)
            
        }
    }
}

//A little complicated, but a very transparent slider that is hidden over the stars for the user to interact with.
struct CustomSlider: View {
    
    @Binding var value: Double
    let range: ClosedRange<Double>

    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack(alignment: .leading) {
                
                // Slider Track
                Capsule()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 10)

                // Slider Thumb
                Circle()
                    .fill(Color.gray)
                    .frame(width: 20, height: 20)
                    .offset(x: thumbOffset(in: geometry.size.width))
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                // Handle drag for thumb
                                let newX = gesture.location.x
                                self.value = roundToNearestHalf(value: value(from: newX, in: geometry.size.width))
                            }
                    )
            }
            .contentShape(Rectangle()) // Make entire area tappable
            .gesture(
                DragGesture(minimumDistance: 0) // Capture taps and drags
                    .onEnded { gesture in
                        // Handle tap/click on track
                        let tapX = gesture.location.x
                        self.value = roundToNearestHalf(value: value(from: tapX, in: geometry.size.width))
                    }
            )
            
        }
        .frame(height: 20)
    }
    
    //Helper function to round to the nearest half-star.
    private func roundToNearestHalf(value: Double) -> Double {
        
            return (value * 2).rounded() / 2
        
    }

    //Helper function for the slider.
    private func thumbOffset(in width: CGFloat) -> CGFloat {
        
        let normalizedValue = (value - range.lowerBound) / (range.upperBound - range.lowerBound)
        return normalizedValue * (width - 20) // Adjust for thumb width
        
    }

    //Another helper function for the slider.
    private func value(from x: CGFloat, in width: CGFloat) -> Double {
        
        let percentage = max(0, min(1, x / width))
        return range.lowerBound + (range.upperBound - range.lowerBound) * percentage
        
    }
}
