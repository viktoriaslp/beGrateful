//
//  Emotion.swift
//  beGrateful
//
//  Created by Victoria Slyunko on 31.03.2025.
//
import Foundation

enum Emotions: String, CaseIterable, Identifiable, Codable {
    case happy = "Happy"
    case sad = "Sad"
    case grateful = "Grateful"
    case excited = "Excited"
    case calm = "Calm"
    case tired = "Tired"
    case motivated = "Motivated"
    
    var id: String { self.rawValue }
}
