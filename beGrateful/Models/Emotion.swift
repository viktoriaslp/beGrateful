//
//  Emotion.swift
//  beGrateful
//
//  Created by Victoria Slyunko on 31.03.2025.
//
import Foundation
import SwiftUI

enum Emotions: String, CaseIterable, Identifiable, Codable {
    case happy = "Happy"
    case grateful = "Grateful"
    case calm = "Calm"
    case motivated = "Motivated"
    case sad = "Sad"
    case anxious = "Anxious"
    case angry = "Angry"
    
    var id: String { self.rawValue }
    
    // Optional: associate a color for each emotion
    var color: Color {
        switch self {
        case .happy:
            return .yellow
        case .grateful:
            return .green
        case .calm:
            return .blue.opacity(0.5)
        case .motivated:
            return .purple
        case .sad:
            return .blue
        case .anxious:
            return .orange
        case .angry:
            return .red
        }
    }
    
    var emoji: String {
        switch self {
        case .happy: return "😊"
        case .grateful: return "🙏"
        case .calm: return "😌"
        case .motivated: return "💪"
        case .sad: return "😢"
        case .anxious: return "😰"
        case .angry: return "😠"
        }
    }
}
