//
//  CategoryItem.swift
//  Books
//
//  Created by Dang Le on 7/8/22.
//
import SwiftUI

struct CategoryItem: View {
    var book: Book
    
    var body: some View {
        VStack(alignment: .leading){
            book.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(10)
            
            Text(book.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(book: ModelData().books[2])
    }
}
