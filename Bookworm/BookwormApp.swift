//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Mert Ali Hanbay on 5.03.2024.
//

import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
