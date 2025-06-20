//
//  NewEntry.swift
//  beGrateful
//
//  Created by Victoria Slyunko on 14.03.2025.
//

import SwiftData
import SwiftUI

struct NewEntry: View {
    @AppStorage("memoriesCount") var memoriesCount = 0
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @Binding var canDismiss: Bool

    // MARK: - Modelo temporal para crear una memoria
    @State var memory = MemoryItem(
        date: Date(),
        text: "",
        quoteOfTheDay: true,
        emotion: .happy
    )
    
    // Estados para mostrar alertas
    @State private var showCancelAlert = false
    @State private var showSuccessAlert = false
    @State private var showErrorAlert = false
    
    // MARK: - Vista principal
    var body: some View {
        NavigationStack {
            Form {
                // Fecha
                HStack {
                    Spacer()
                    DatePicker("Date", selection: $memory.date)
                        .labelsHidden()
                    Spacer()
                }
                .listRowBackground(Color.clear)

                // Texto de gratitud
                Section {
                    TextEditor(text: $memory.text)
                        .frame(height: 200)
                        .onChange(of: memory.text) { oldValue, newValue in
                            canDismiss = newValue.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
                        }

                } header: {
                    Text("What are you grateful for tooday?")
                        .foregroundStyle(.black)
                } footer: {
                    Text("Write your gratitude as a positive message to your future self. Keep it short, uplifting, and in the present tense. Example: ‘I am grateful for my strength today.")
                }
                
                // Emoción
                Section {
                    Picker("How are you feeling?", selection: $memory.emotion) {
                        ForEach(Emotions.allCases, id: \.self) { emotion in
                            Text(emotion.rawValue.capitalized)
                        }
                    }
                    .pickerStyle(.navigationLink)
                    .listRowBackground(Color.clear)

                }
                
                // Incluir en frase del día
                Section {
                    Toggle("Include to quote of the day", isOn: $memory.quoteOfTheDay)
                        .listRowBackground(Color.clear)

                }
            }
            .scrollContentBackground(.hidden)
            .background(Color("mybackground"))
            .navigationTitle("New Entry")
            .navigationBarTitleDisplayMode(.inline)
            
            // MARK: - Barra inferior con botones
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    // Cancelar
                    Button("Cancel", role: .destructive) {
                        showCancelAlert = true
                    }
                    .foregroundStyle(.red)
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    // Guardar
                    Button("Save") {
                        if memory.text.isEmpty {
                                showErrorAlert = true
                        } else {
                            modelContext.insert(memory)
                            showSuccessAlert = true
                            memory = MemoryItem(date: Date(), text: "", quoteOfTheDay: true, emotion: .happy)
                            memoriesCount += 1
                        }
                    }
                    .padding()
                    .foregroundColor(Color("fortexts"))
                }
            }
            // MARK: - Alertas
            .alert("Are you sure you want to cancel?", isPresented: $showCancelAlert) {
                Button("Yes", role: .destructive) {
                    memory = MemoryItem(date: Date(), text: "", quoteOfTheDay: true, emotion: .happy)
                    dismiss()
                }
                Button("No", role: .cancel) { }
            }

            .alert("Memory saved!", isPresented: $showSuccessAlert) {
                Button("OK", role: .cancel) {
                    dismiss()
                }
            }

            .alert("Please enter some text before saving.", isPresented: $showErrorAlert) {
                Button("OK", role: .cancel) { }
            }
        }
    }
}

#Preview {
    NewEntry(canDismiss: .constant(true))
        .modelContainer(for: MemoryItem.self)
}
