//
//  ContentView.swift
//  beGrateful
//
//  Created by Victoria Slyunko on 14.03.2025.
//

import StoreKit
import SwiftData
import SwiftUI

struct ContentView: View {
    @AppStorage("memoriesCount") var memoriesCount = 0
    @Environment(\.requestReview) var requestReview
    
    
    @State private var selectedTab = 0 // Comienza en Home
    @State private var showingNewEntry = false // controlar si el sheet está abierto
    @State private var canDismissNewEntry = true


    var body: some View {
        ZStack {
            // Vista principal según la pestaña seleccionada
            switch selectedTab {
            case 0:
                Home()
            case 1:
                QuoteOfTheDay(showingNewEntry: $showingNewEntry)
            case 2:
                NewEntry(canDismiss: $canDismissNewEntry)
            case 3:
                MemoriesList(showingNewEntry: $showingNewEntry)
            case 4:
                Export()
            default:
                NewEntry(canDismiss: $canDismissNewEntry)
            }

            // MARK: - Barra personalizada
            GeometryReader { geo in
                
                VStack {
                    Spacer()
                    HStack {
                        // Home
                        tabBarButton(image: "house.fill", text: "Home", tab: 0)
                            .frame(width: geo.size.width / 6)
                        // Today
                        tabBarButton(image: "quote.opening", text: "Quote", tab: 1)
                            .frame(width: geo.size.width / 6)
                        
                        // Botón central (+)
                        Button {
                            canDismissNewEntry = true
                            showingNewEntry = true
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .font(.system(size: 60))
                                .foregroundColor(Color("forbuttons"))
                                .shadow(radius: 4)
                            // Para hacer sobresalir boton con color de fondo
                                .background(Color("mybackground")) // si quieres redondear la base
                                .clipShape(Circle())
                                .offset(y: -30)
                        }
                        // .offset(y: -20)
                        .frame(width: geo.size.width / 6)
                        .sheet(isPresented: $showingNewEntry) {
                            NewEntry(canDismiss: $canDismissNewEntry)
                                    .interactiveDismissDisabled(!canDismissNewEntry)
                        }
                        
                        // Memories
                        tabBarButton(image: "archivebox.fill", text: "Memories", tab: 3)
                            .frame(width: geo.size.width / 6)
                        
                        // PDF
                        tabBarButton(image: "arrow.down.doc.fill", text: "PDF", tab: 4)
                            .frame(width: geo.size.width / 6)
                    }
                    .padding(.horizontal)
                    .background(Color("mybackground").ignoresSafeArea(edges: .bottom))
                    // Review request
                    .onChange(of: memoriesCount) { oldValue, newValue in
                        if newValue == 5 {
                            requestReview()
                        }
                    }
                }
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
