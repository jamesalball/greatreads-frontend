import SwiftUI


#Preview {
    
    ContentView()
        .environmentObject(NavigationModel())
    
}

struct RecentSearchesView: View {
    @EnvironmentObject var navigationModel: NavigationModel
    @FocusState.Binding var isSearching: Bool
    
    private let bookList: [Book]
    
    
    init(isSearching: FocusState<Bool>.Binding) {
        self._isSearching = isSearching
        
        let jsonString = #"""
        [
            {
                "id": "1",
                "title": "Pet Semetary",
                "author": "Stephen King",
                "description": "It's a long story, but it's true.",
                "avgRating": 4.5
            },
            
            {
                "id": "2",
                "title": "The Stand",
                "author": "Stephen King",
                "description": "It's a long story, but it's true.",
                "avgRating": 4.2
            },
            
            {
                "id": "3",
                "title": "IT",
                "author": "Stephen King",
                "description": "It's a long story, but it's true.",
                "avgRating": 4.8
            },
            
            {
                "id": "4",
                "title": "The Shining",
                "author": "Stephen King",
                "description": "It's a long story, but it's true.",
                "avgRating": 3.9
            },
            
            {
                "id": "5",
                "title": "Carrie",
                "author": "Stephen King",
                "description": "It's a long story, but it's true.",
                "avgRating": 3.2
            }
        ]
        """#
        
        guard let jsonData = jsonString.data(using: .utf8) else {
            fatalError("Failed to convert string to data.")
        }
        
        let decoder = JSONDecoder()
        
        do {
            self.bookList = try decoder.decode([Book].self, from: jsonData)
        } catch {
            self.bookList = []
            print("Error decoding JSON: \(error)")
        }
        
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30){
                
                ForEach(bookList) { book in
                    BookCard(book: book)
                        .environmentObject(navigationModel)
                }
                
            }
            .padding()
        }
        .onScrollGeometryChange(for: CGFloat.self, of: { geometry in
            geometry.contentOffset.y
        }) { oldOffset, newOffset in
            isSearching = false
        }
        .navigationBarBackButtonHidden(true)
    }
}
