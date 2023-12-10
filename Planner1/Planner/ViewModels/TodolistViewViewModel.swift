//
//  TodolistViewViewModel.swift
//  Planner
//
//  Created by csuftitan on 11/6/23.
//
import FirebaseFirestore
import Foundation
class TodolistViewViewModel: ObservableObject{
    @Published var showingNewitemView = false
    private let userId: String
    init(userId: String) {
        self.userId = userId
    }
    /// DELETE TO DO LIST ITEM
    /// - Parameter id: ITEM ID TO DELETE 
        func delete(id: String){
            let db = Firestore.firestore()
            
            db.collection("users")
                .document(userId)
                .collection("todos")
                .document(id)
                .delete()
        }
    }

