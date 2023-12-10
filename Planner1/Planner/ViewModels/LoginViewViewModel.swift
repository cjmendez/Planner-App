//
//  LoginViewViewModel.swift
//  Planner
//
//  Created by csuftitan on 11/6/23.
//
import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errormessage = ""
    init(){}
    func login(){
        guard validate() else {
            return
        }
        Auth.auth().signIn(withEmail: email, password: password)
    }
    private func validate() -> Bool{
        //if the email and password is empty it would show "Please fill in all fields."
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, 
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            
            errormessage = "Please fill in all fields."
                
            return false
        }
        // if the email doesn't have @ and . it would show "lease enter valid email."
        guard email.contains("@") && email.contains(".")else{
            errormessage = "Please enter valid email."
            return false
        }
        // if stisfy all the condition of guard return true
        print("called")
        return true
    }
}
