//
//  QuoteOfTheDay.swift
//  beGrateful
//
//  Created by Victoria Slyunko on 14.03.2025.
//

import SwiftData
import SwiftUI

//struct QuoteOfTheDay: View {
  //  var body: some View {
   //     Text("Nice foto icon on top")
     //   Text("Quote of the day choosed randomly from your gratitude journal")
    //    Text("Botones: Generate randomly new quote / Save it as a wallpaper or share it some social media")
   //     Text("the day was wrote")

        
//    }
// }

struct QuoteOfTheDay: View {
    @State private var randomImage = ImageHelper.getRandomImage()

    var body: some View {
        VStack {
            Image(randomImage)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding()

            Text("Your motivational quote here")
                .font(.title)
                .padding()

            HStack {
                Button(action: {
                    randomImage = ImageHelper.getRandomImage()
                }) {
                    Text("Nueva Imagen")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                // TODO: Añadir un boton de descarga
            }
            
        }
        .onAppear {
            randomImage = ImageHelper.getRandomImage()
        }
        
        // TODO: que la barra desaparezca al tocar pantalla

    }
}

#Preview {
    QuoteOfTheDay()
}
