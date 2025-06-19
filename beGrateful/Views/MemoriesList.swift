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
            if memories.isEmpty {
                EmptyStateView {
                    showingNewEntry = true
                }
                .navigationTitle("My Memories")
                .background(Color("mybackground"))
            } else {
                List {
                    // TODO: Search line, to search something inside the text of the memories
                    TextField("The search line", text: .constant(""))
                    // TODO: Choose if we want to ordenar from newest to oldest or from oldest to newst.
                    // TODO: Look for a specifict day entry trough the calendar
                    // Una lista de todas las memories (no se muy bien como representar cada una de ellas.
                    ForEach(memories) { memory in
                        VStack(alignment: .leading, spacing: 6) {
                            Text(memory.text)
                                .font(.body)
                            Text(memory.date.formatted(date: .abbreviated, time: .omitted))
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                    .onDelete(perform: deleteMemories)
                }
                .navigationTitle("My Memories")
                .background(Color("mybackground"))
                .scrollContentBackground(.hidden)
            }
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
