//
//  ImageHelper.swift
//  beGrateful
//
//  Created by Victoria Slyunko on 31.03.2025.
//


import Foundation

struct ImageHelper {
    static let images = ["flower_pose", "hand_flower", "hand_heart_plant", "heart_hug", "landscape_heart", "leaf_branch", "meditation", "profile_lineart", "read_plant", "rose_lineart", "single_flower", "woman_pose"]
    
    static func getRandomImage() -> String {
        return images.randomElement() ?? "image1"
    }
}
