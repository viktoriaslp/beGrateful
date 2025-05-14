//
//  ContentView.swift
//  beGrateful
//
//  Created by Victoria Slyunko on 14.03.2025.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0 // Comienza en Home
    @State private var showingNewEntry = false // controlar si el sheet está abierto

    var body: some View {
        ZStack {
            // Vista principal según la pestaña seleccionada
            switch selectedTab {
            case 0:
                Home()
            case 1:
                QuoteOfTheDay()
            case 2:
                NewEntry()
            case 3:
                MemoriesList()
            case 4:
                Export()
            default:
                NewEntry()
            }

            // MARK: - Barra personalizada
            VStack {
                Spacer()
                HStack {
                    // Home
                    tabBarButton(image: "house.fill", text: "Home", tab: 0)
                    Spacer()
                    
                    // Today
                    tabBarButton(image: "quote.opening", text: "Today", tab: 1)
                    Spacer()
                    
                    // Botón central (+)
                    // TODO: hacer de esto una ventana emergente, no completamente nueva.
                    Button {
                         showingNewEntry = true
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 50))
                            .foregroundColor(Color("forbuttons"))
                            .shadow(radius: 4)
                    }
                    .offset(y: -20)
                    .sheet(isPresented: $showingNewEntry) {
                        NewEntry()
                    }
                    
                    Spacer()
                    
                    // Memories
                    tabBarButton(image: "archivebox.fill", text: "MemoriesList", tab: 3)
                    Spacer()
                    
                    // PDF
                    tabBarButton(image: "arrow.down.doc.fill", text: "PDF", tab: 4)
                }
                .padding(.horizontal)
                .padding(.top, 10)
                .padding(.bottom, 20)
                .background(Color("mybackground").ignoresSafeArea(edges: .bottom))
            }
        }
    }
    
    // MARK: - Botón de barra inferior
    func tabBarButton(image: String, text: String, tab: Int) -> some View {
        Button {
            selectedTab = tab
        } label: {
            VStack(spacing: 4) {
                Image(systemName: image)
                    .font(.system(size: 20))
                Text(text)
                    .font(.caption2)
            }
            .foregroundColor(selectedTab == tab ? Color("forbuttons") : .gray)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: MemoryItem.self)
}
