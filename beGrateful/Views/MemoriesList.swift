//
//  Memories.swift
//  beGrateful
//
//  Created by Victoria Slyunko on 14.03.2025.
//

import SwiftData
import SwiftUI


struct MemoriesList: View {
    
    @Query var memories: [MemoryItem]
    @Environment(\.modelContext) var modelContext
    
    @Binding var showingNewEntry: Bool

    
    var body: some View {
        NavigationStack {
            Group {
                if memories.isEmpty {
                    EmptyStateView {
                        showingNewEntry = true
                    }
                } else {
                    List {
                        // TODO: Search line, to search something inside the text of the memories
                        TextField("The search line", text: .constant(""))
                        // TODO: Choose if we want to ordenar from newest to oldest or from oldest to newst.
                        // TODO: Look for a specifict day entry trough the calendar
                        // Una lista de todas las memories (no se muy bien como representar cada una de ellas.
                        ForEach(memories) { memory in
                            HStack {
                                Text(memory.emotion.emoji)
                                    .font(.title3)
                                
                                VStack(alignment: .leading, spacing: 6) {
                                    Text(memory.text)
                                        .font(.body)
                                    Text(memory.date.formatted(date: .abbreviated, time: .omitted))
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                                .padding(6)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                        .onDelete(perform: deleteMemories)
                    }
                    .scrollContentBackground(.hidden)
                }
            }
            .navigationTitle("My Memories")
            .background(Color("mybackground"))
        }
    }
    
    func deleteMemories(at offsets: IndexSet) {
        for offset in offsets {
            let memory = memories[offset]
            modelContext.delete(memory)
        }
    }
}

#Preview {
    MemoriesList(showingNewEntry: .constant(false))
        .modelContainer(for: MemoryItem.self)
}
