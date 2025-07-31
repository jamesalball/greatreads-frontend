//
//  MyBooksView.swift
//  Gooder Reads
//
//  Created by James Ball on 8/13/25.
//

import SwiftUI

#Preview {
    ContentView()
        .environmentObject(NavigationModel())
}

struct MyBooksView: View {
    @EnvironmentObject var navigationModel: NavigationModel
    @FocusState.Binding var isSearching: Bool
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Currently Reading")
                    .bold()
                    .underline()
                ScrollView(.horizontal) {
                    HStack {
                        let testBook = Book(id: "7", title: "The Stand", author: "Stephen King", description: "Test", avgRating: 1.4)
                        BookCard(book: testBook)
                        BookCard(book: testBook)
                        BookCard(book: testBook)
                    }
                }
                
                Spacer()
                    .frame(height: 30)
                
                Text("Collections")
                    .bold()
                    .underline()
                
                collectionCard(collectionName: "Read", numBooks: 150)
                collectionCard(collectionName: "To Be Read", numBooks: 299)
                
                Spacer()
            }
            .padding()
        }
    }
}

struct collectionCard: View {
    
    let collectionName: String
    let numBooks: Int
    
    var body: some View {
        
        Button {
            print(collectionName)
        } label: {
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                        .frame(width: 30)
                    
                    Image(systemName: "book.closed")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 75, height: 75)
                    
                    Spacer()
                        .frame(width: 20)
                    
                    VStack (alignment: .leading) {
                        Text(collectionName)
                            .font(.title2)
                        
                        Text("\(numBooks) books")
                            .font(.subheadline)
                            .opacity(0.6)
                    }
                    
                    Spacer()
                }
                
                Spacer()
            }
            .frame(height: 140)
            /*.overlay(
             Rectangle()
             .frame(height: 1) // For a bottom border
             .foregroundColor(.white),
             alignment: .bottom // Adjust alignment for different sides
             )*/
            .background(
                Rectangle()
                    .foregroundStyle(.gray)
                    .opacity(0.25)
                    .brightness(-0.4)
            )
        }
        
    }
}
