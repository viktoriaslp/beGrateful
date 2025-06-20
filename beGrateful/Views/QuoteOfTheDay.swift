//
//  QuoteOfTheDay.swift
//  beGrateful
//
//  Created by Victoria Slyunko on 14.03.2025.
//
// View that displays a random background image and a gratitude quote marked as 'quoteOfTheDay'.


import SwiftData
import SwiftUI

struct QuoteOfTheDay: View {
    // Fetches all memory entries where 'quoteOfTheDay' is true
    @Query(filter: #Predicate<MemoryItem> { $0.quoteOfTheDay }) var quotes: [MemoryItem]
    
    @Binding var showingNewEntry: Bool
    
    // Holds a randomly selected image
    @State private var randomImage = ImageHelper.getRandomImage()

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                // Decorative image shown at the top
                Image(randomImage)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .padding()
                
                // If there's at least one quote available, display it
                if let quote = quotes.randomElement(), !quote.text.isEmpty {
                    Text(quote.text)
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("fortexts"))
                        .padding()
                // If no quotes are available, show a custom empty state with an option to add one
                } else {
                    EmptyStateView {
                        showingNewEntry = true
                    }
                }
                Spacer()
                Spacer()
            }
            .padding(.bottom, 60)
            .toolbar {
                // TODO: Improve the UI/UX for switching quotes or images
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        Button("New Quote") {
                            // currentQuote = quotes.randomElement()
                        }
                        
                        Button("New Image") {
                            randomImage = ImageHelper.getRandomImage()
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
                // TODO: Save it as a wallpaper or share it some social media.
                // Share button to export the quote to other apps or social media
                ToolbarItem(placement: .topBarTrailing) {
                    ShareLink(item: "Test") {
                        Label("Share", systemImage: "square.and.arrow.up")
                            .padding()
                            .background(Color("forbuttons"))
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }
                }
            }
            Spacer()
        }
        
        // TODO: Add a button to let users pick a background color manually
        
        // Loads a new random image every time the view appears
        .onAppear {
            randomImage = ImageHelper.getRandomImage()
        }
    }
}

#Preview {
    QuoteOfTheDay(showingNewEntry: .constant(false))
        .modelContainer(for: MemoryItem.self)
}
