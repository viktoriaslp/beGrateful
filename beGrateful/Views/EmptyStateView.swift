//
//  EmptyStateView.swift
//  beGrateful
//
//  Created by Victoria Slyunko on 19/6/25.
//

import SwiftUI

struct EmptyStateView: View {
    var action: () -> Void

    var body: some View {
        ContentUnavailableView {
            Text("No entries yet")
                .font(.title)
        } description: {
            Text("Start your gratitude journey by writing your first memory.")
        } actions: {
            Button(action: action) {
                Label("Add Memory", systemImage: "plus.circle.fill")
                    .padding(10)
                    .frame(maxWidth: .infinity)
                    .background(Color("forbuttons"))
                    .foregroundColor(.white)
                    .clipShape(Capsule())
            }
        }
    }
}

#Preview {
    EmptyStateView(action: {})
}
