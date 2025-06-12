//
//  Home.swift
//  beGrateful
//
//  Created by Victoria Slyunko on 18.04.2025.
//

import SwiftData
import SwiftUI

struct Home: View {
    @Query var memories: [MemoryItem]

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Text("Welcome back, Viktoria 🌿")
                .font(.title)
                .padding(.top)

            if let last = memories.last {
                VStack(alignment: .leading) {
                    Text("Last entry:")
                        .font(.headline)
                    Text(last.text)
                        .font(.body)
                }
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            } else {
                Text("You haven't added any memories yet.")
                    .italic()
                    .foregroundColor(.gray)
            }

            Spacer()
        }
    }
}

#Preview {
    Home()
}
