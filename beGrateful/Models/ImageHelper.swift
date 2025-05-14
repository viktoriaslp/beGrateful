//
//  ImageHelper.swift
//  beGrateful
//
//  Created by Victoria Slyunko on 31.03.2025.
//


import Foundation

struct ImageHelper {
    static let images = ["image1", "image2", "image3", "image4", "image5", "image6"]
    
    static func getRandomImage() -> String {
        return images.randomElement() ?? "image1"
    }
}
