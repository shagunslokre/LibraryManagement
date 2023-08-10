//
//  BookDetail.swift
//  Books
//
//  Created by Dang Le on 6/18/22.
//

import SwiftUI

struct BookDetail: View {
    @EnvironmentObject var modelData : ModelData
    var book: Book
    
    var bookIndex : Int {
        modelData.books.firstIndex(where: {$0.id == book.id})!
    }

    var body: some View {
        ScrollView {
            HeaderImage()
                .ignoresSafeArea(edges: .top)
                .frame(height: 200)
            
            CircleImage(image: book.image)
                .offset(y: -150)
                .padding(.bottom, -150)
            
            VStack(alignment: .leading) {
                HStack{
                    Text(book.name)
                        .font(.title)
                        .foregroundColor(.black)
                    FavoriteButton(isSet: $modelData.books[bookIndex].isFavorite)
                }
                
                
                HStack {
                    Text("Author")
                    Spacer()
                    Text(book.author)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text(book.price)
                    .foregroundColor(.blue)
                
                Divider()
                
                Text("Synopsis about \(book.name)")
                    .font(.title2)
                Text(book.description)
                    .font(.caption)
            }
            .padding()
            
            Spacer()
        
        }
    }
}

struct BookDetail_Previews: PreviewProvider {
    static var previews: some View {
        BookDetail(book: ModelData().books[0])
    }
}
