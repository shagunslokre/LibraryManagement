//
//  HeaderImage.swift
//  Books
//
//  Created by Dang Le on 6/17/22.
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
