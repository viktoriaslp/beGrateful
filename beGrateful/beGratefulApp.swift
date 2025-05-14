//
//  beGratefulApp.swift
//  beGrateful
//
//  Created by Victoria Slyunko on 14.03.2025.
//

import SwiftUI

@main
struct beGratefulApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: MemoryItem.self)
    }
}
