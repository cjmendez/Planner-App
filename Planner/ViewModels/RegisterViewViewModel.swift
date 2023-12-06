//
//  RegisterViewViewModel.swift
//  Planner
//
//  Created by csuftitan on 11/6/23.
//
import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewViewModel: ObservableObject{
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errormessage = ""
    
    init(){}
    
    private func insertUserRecord(id: String){
            let newUser = User(id: id,
                               name: name,
                               email: email,
                               joined: Date().timeIntervalSince1970)
            let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
                }
    
    func register(){
        guard validate() else{
            return
        }
        Auth.auth().createUser(withEmail: email, password: password)
            { [weak self]result, error in
            guard let userId = result?.user.uid else{
                return
            }
            self?.insertUserRecord(id: userId)
        }
    }
    
    
    private func validate() -> Bool {
        guard 
            !name.trimmingCharacters(in: .whitespaces).isEmpty,
            !email.trimmingCharacters(in: .whitespaces).isEmpty,
            !password.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            
            errormessage = "Please fill in all fields."
                
            return false
        }
        guard email.contains("@") && email.contains(".")else{
            errormessage = "Please enter valid email."
            return false
        }
        guard password.count >= 6 else{
            errormessage = "Please enter more than 6 digit for the password"
            return false
        }
        
        print("called for register")
        return true
    }
}
