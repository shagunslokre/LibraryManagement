//
//  BookList.swift
//  Books
//
//  Created by Dang Le on 6/18/22.
//

import SwiftUI

struct BookList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    //some is used to define an Opaque Type and opaque type is a way to return a type without needing to provide details on the concrete type itself.
    
    var filteredBooks: [Book]{
        modelData.books.filter{book in
            (!showFavoritesOnly || book.isFavorite)
        }
    }
    var body: some View {
        //NavigationView use to transverse a collection of Views
        NavigationView{
            List{
                Toggle(isOn: $showFavoritesOnly){
                    Text("Favorites Only")
                }
                
                ForEach(filteredBooks){ book in
                    NavigationLink{
                        //links it goes to opens up BookDetail Struct
                        BookDetail(book: book)
                    } label: {
                        //shows the Book in row
                        BookRow(book: book)
                    }
                }

            }
            .navigationTitle("Books")
        }
        
    }
}


struct BookList_Previews: PreviewProvider {
    static var previews: some View {
        BookList()
            .environmentObject(ModelData())
    }
}
