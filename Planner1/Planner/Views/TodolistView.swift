//  TodolistView.swift
import FirebaseFirestoreSwift
import SwiftUI

struct TodolistView: View {
    @StateObject var viewModel: TodolistViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: TodolistViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(items) { item in
                        TodolistitemView(item: item)
                            .swipeActions {
                                Button("Delete") {
                                    viewModel.delete(id: item.id)
                                }
                                .tint(.red)
                            }
                    }
                    .onDelete(perform: deleteItem) // Add delete action
                    .onMove(perform: moveItem)     // Add move action
                }
                .listStyle(PlainListStyle())
                .navigationTitle("To Do List")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton() // Edit button added here
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            viewModel.showingNewitemView = true
                        }) {
                            Image(systemName: "plus")
                        }
                    }
                }
                .sheet(isPresented: $viewModel.showingNewitemView) {
                    NewitemView(newItemPresented: $viewModel.showingNewitemView)
                }
            }
        }
    }

    // Functions to handle delete and move actions
    func deleteItem(at offsets: IndexSet) {
        // Implement deletion logic
    }
    
    func moveItem(from source: IndexSet, to destination: Int) {
        // Implement move logic
    }
}

// Preview
struct TodolistView_Previews: PreviewProvider {
    static var previews: some View {
        TodolistView(userId: "5raGUhdic3NQBV2ZdQ6RiP4ezfG2")
    }
}
