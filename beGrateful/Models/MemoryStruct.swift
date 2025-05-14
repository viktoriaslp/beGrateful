//
//  MemoryStruct.swift
//  beGrateful
//
//  Created by Victoria Slyunko on 31.03.2025.
//

import Foundation
import SwiftData

@Model
class MemoryItem {
    var id: UUID
    var date: Date
    var text: String
    var quoteOfTheDay: Bool
    var emotion: Emotions

    init(id: UUID = UUID(), date: Date, text: String, quoteOfTheDay: Bool, emotion: Emotions) {
        self.id = id
        self.date = date
        self.text = text
        self.quoteOfTheDay = quoteOfTheDay
        self.emotion = emotion
    }
}
