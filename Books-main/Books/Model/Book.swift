//
//  Book.swift
//  Books
//
//  Created by Dang Le on 6/18/22.
//

import Foundation
import SwiftUI

//a structure is public compare to a class
// the ":" basicaly means "of type" in this case
//the struct is of type Hashable and Codable
struct Book: Hashable, Codable, Identifiable {
    
    //properties we are declaring for this struct
    var id: Int
    var name: String
    var genre: String
    var price: String
    var author: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case math = "Math"
        case science = "Science"
        case novel = "Novel"
        
    }
    
    private var imageName: String
    var image: Image{
        Image(imageName)
    }
    
}
