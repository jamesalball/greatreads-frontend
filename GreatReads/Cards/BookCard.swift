//
//  BookCard.swift
//  Gooder Reads
//
//  Created by James Ball on 8/4/25.
//
import SwiftUI

#Preview {
    ContentView()
        .environmentObject(NavigationModel())
    
}

struct BookCard: View {
    
    @EnvironmentObject var navigationModel: NavigationModel
    
    let book: Book
    
    var body: some View {
        
        Button {
            navigationModel.path.append(Destination.bookView(book: book))
        } label : {
            BookCardDetails(book: book)
        }
    }
}


struct BookCardDetails: View {
    let book: Book
    
    var body: some View {
        HStack {
            
            Image(systemName: "book.closed")
                .font(.largeTitle)
                .frame(width: 80)
                .padding(.trailing, 10)
            
            VStack(alignment: .leading) {
                Text(book.title)
                    .font(.headline)
                Text(book.author)
                    .font(.caption)
                
                HStack {
                    RatingStars(avgRating: book.avgRating, starSize: 10)
                    
                    Text(String(format: "%.1f", book.avgRating))
                        .font(.subheadline)
                    
                    Text("1.3k ratings")
                        .font(.subheadline)
                        .frame(alignment: .trailing)
                }
                
                Button("Add to TBR") {
                    //Add to TBR action
                }
                .frame(width: 200, height: 35)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .opacity(0.4)
                        .foregroundStyle(Color.pink)
                )
            }
            
            Spacer()
        }
        .padding()
        .background(
            Rectangle()
                .foregroundStyle(.gray)
                .opacity(0.25)
                .brightness(-0.4)
        )
        .foregroundStyle(.white)
    }
}
