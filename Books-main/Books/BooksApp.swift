//
//  BooksApp.swift
//  Books
//
//  Created by Dang Le on 6/17/22.
//

import SwiftUI

@main
struct BooksApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
