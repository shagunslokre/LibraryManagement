//
//  HeaderImage.swift
//  Books
//

import SwiftUI

struct HeaderImage: View {
    var body: some View {
        Image("bookshelf")
            .resizable()
            .frame(height:200)
    }
}

struct HeaderImage_Previews: PreviewProvider {
    static var previews: some View {
        HeaderImage()
    }
}
