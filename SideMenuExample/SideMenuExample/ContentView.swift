//
//  ContentView.swift
//  SideMenuExample
//
//  Created by John Baker on 10/26/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    var navigationController = NavigationController()

    var body: some View {
        NavigationSplitView {
            ZStack {
                if navigationController.isShowingSidebar {
                    SideMenuView()
                }
                
                Group {
                    if navigationController.selectedScreen == .mainScreen {
                        List {
                            ForEach(items) { item in
                                NavigationLink {
                                    Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                                } label: {
                                    Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                                }
                            }
                            .onDelete(perform: deleteItems)
                        }
                        
                    }
                    
                    if navigationController.selectedScreen == .secondaryScreen {
                        VStack {
                            Text("Second Screen")
                        }
                        .cornerRadius(navigationController.isShowingSidebar ? 20 : 10)
                        .scaleEffect(navigationController.isShowingSidebar ? 0.8 : 1)
                        .offset(x: navigationController.isShowingSidebar ? 300 : 0, y: navigationController.isShowingSidebar ? 44 : 0)
                        
                    }
                }
                .cornerRadius(navigationController.isShowingSidebar ? 20 : 10)
                .scaleEffect(navigationController.isShowingSidebar ? 0.8 : 1)
                .offset(x: navigationController.isShowingSidebar ? 300 : 0, y: navigationController.isShowingSidebar ? 44 : 0)
                
                
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            withAnimation {
                                navigationController.isShowingSidebar.toggle()
                            }
                        }) {
                            Image(systemName: "line.3.horizontal")
                                .fontWeight(.bold)
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    ToolbarItem {
                        Button(action: addItem) {
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
        .environment(navigationController)
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
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
}
