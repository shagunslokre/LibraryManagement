//
//  ModelData.swift
//  Books
//
//  Created by Dang Le on 6/18/22.
//

import Foundation
import Combine

final class ModelData: ObservableObject{
    @Published var books: [Book] = load("bookData.json")
    
    @Published var profile = Profile.default
    
    var features: [Book]{
        //$0 means for each landmark
        books.filter{ $0.isFeatured }
    }
    
    //declares datatype strings of dictionary
    var categories: [String: [Book]]{
        Dictionary(
            grouping: books, by: {$0.category.rawValue})
    }

}

func load<T: Decodable> (_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do{
        data = try Data(contentsOf: file)
    }catch{
        fatalError("Couldn't load \(filename) from main bundle: \n\(error)")
    }
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }catch{
        fatalError("Couldn't parse \(filename) as \(T.self): \n\(error)")
    }
}
