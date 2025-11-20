//
//  MyBooksView.swift
//  GreatReads
//
//  Created by James Ball on 8/13/25.
//

import SwiftUI

//Rendering for the Xcode preview panel.
#Preview {
    
    ContentView()
        .environmentObject(NavigationModel())
    
}

/*A struct to display a "My Books" tab, with Books the user is currently reading, wants to read, etc. */
struct MyBooksView: View {
    
    @EnvironmentObject var navigationModel: NavigationModel
    @FocusState.Binding var isSearching: Bool
    
    var body: some View {
        ScrollView {
            VStack {
                
                //A scrollable view showing all the Books the user is currently reading.
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
                
                //All the users other Collections (books read, to-be-read, custom).
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

/*A struct to show a Collection "card." Offers just the name of the collection and the number of Books contained.*/
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
            .background(
                Rectangle()
                    .foregroundStyle(.gray)
                    .opacity(0.25)
                    .brightness(-0.4)
            )
        }
        
    }
}
