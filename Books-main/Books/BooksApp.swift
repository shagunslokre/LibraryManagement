//
//  BooksApp.swift
//  Books
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
