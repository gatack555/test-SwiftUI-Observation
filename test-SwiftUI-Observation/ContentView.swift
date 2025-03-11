//
//  ContentView.swift
//  test-SwiftUI-Observation
//
//  Created by Omata Masaki on 2025/03/11.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @Environment(Facade.self) private var facade

    var body: some View {
        
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        HStack{
                            Text(item.id.uuidString)
                            Text(item.name)
                            Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                        }
                    } label: {
                        HStack {
                            Text("\(facade.count)")
                            Text(item.name)
                            Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                        }
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(name: "hoge1")
            modelContext.insert(newItem)
            
            facade.increment()
            facade.addItem(modelContext: modelContext)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
        .environment(Facade.self, Facade())
}

