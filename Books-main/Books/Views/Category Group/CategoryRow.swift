//
//  CategoryRow.swift
//  Books
//
//  Created by Dang Le on 7/1/22.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Book]
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
             HStack(alignment: .top, spacing: 5) {
                ForEach(items) { book in
                    NavigationLink{
                        BookDetail(book: book)
                    }label:{
                        CategoryItem(book: book)
                        
                    }
                    
                }
             }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var books = ModelData().books
    static var previews: some View {
        CategoryRow(
            categoryName: books[2].category.rawValue,
            items: Array(books.prefix(3))
        )
    }
}
