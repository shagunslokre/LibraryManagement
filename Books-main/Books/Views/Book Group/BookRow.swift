//
//  BookRow.swift
//  Books
//
//  Created by Dang Le on 6/18/22.
//

import SwiftUI

struct BookRow: View {
    
    //type book was created from Book and ModelData file
    var book: Book
    
    var body: some View {
        HStack{
            book.image.resizable().frame(width: 50, height: 50)
            Text(book.name)
            
            Spacer()
            
            if book.isFavorite{
                Image(systemName: "star.fill").foregroundColor(.yellow)
            }
        }
    }
}

struct BookRow_Previews: PreviewProvider {
    static var books = ModelData().books
    
    static var previews: some View {
        Group{
            BookRow(book: books[0])
            BookRow(book: books[1])
        }.previewLayout(.fixed(width:300, height: 70))
        //instead of wasting lines if you group them and then add previewLayout metho you will only have to type it once
    }
}
