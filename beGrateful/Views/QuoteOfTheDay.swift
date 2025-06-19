//
//  QuoteOfTheDay.swift
//  beGrateful
//
//  Created by Victoria Slyunko on 14.03.2025.
//

import SwiftData
import SwiftUI


    //    Text("Botones: Generate randomly new quote / Save it as a wallpaper or share it some social media")
   //     Text("the day was wrote")


struct QuoteOfTheDay: View {
    @Query(filter: #Predicate<MemoryItem> { $0.quoteOfTheDay }) var quotes: [MemoryItem]
    
    @Binding var showingNewEntry: Bool

    @State private var randomImage = ImageHelper.getRandomImage()

    var body: some View {
        VStack {
            Image(randomImage)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .padding()
            
            if let quote = quotes.randomElement(), !quote.text.isEmpty {
                Text(quote.text)
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("fortexts"))
                    .padding()
            } else {
                EmptyStateView {
                    showingNewEntry = true
                }
            }
        }
        .padding(.bottom, 60)
        
        //.toolbar {
        //    ToolbarItem(placement: .bottomBar) {
        //        HStack {
        //            Button("New Quote") {
        //                // currentQuote = quotes.randomElement()
        //            }
        //            .padding()
        //            .background(Color("forbuttons"))
        //            .foregroundColor(.white)
        //            .clipShape(Capsule())
                    
        //            Button("New Image") {
        //                randomImage = ImageHelper.getRandomImage()
        //            }
        //            .padding()
        //            .background(Color("forbuttons"))
        //            .foregroundColor(.white)
        //            .clipShape(Capsule())
        //        }
        //        .frame(maxWidth: .infinity)
        //    }
        //}
        
        // TODO: Añadir un boton de descarga
        // TODO: Añadir boton para elegir color de fondo
        //TODO: Mejorar boton de cambiar imagen o frase
        
        .onAppear {
            randomImage = ImageHelper.getRandomImage()
        }
        
        // TODO: que la barra desaparezca al tocar pantalla

    }
}

#Preview {
    QuoteOfTheDay(showingNewEntry: .constant(false))
        .modelContainer(for: MemoryItem.self)
}
