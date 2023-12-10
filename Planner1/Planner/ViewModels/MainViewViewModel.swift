//
//  MainViewViewModel.swift
//  Planner
//
//  Created by csuftitan on 11/6/23.
//

import FirebaseAuth
import Foundation

class MainViewViewModel: ObservableObject{
    @Published var currentuserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener {[weak self] _, user in
            DispatchQueue.main.async {
                self?.currentuserId = user?.uid ?? ""
                print("Current user ID: \(self?.currentuserId ?? "nil")")
            }
        }
        print("Initial user: \(Auth.auth().currentUser?.uid ?? "nil")")
    }

    //return true when there is a currentUser
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
        
    }
}
