//
//  Registerview.swift
//  Planner
//
//  Created by csuftitan on 11/6/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack(content: {
            headerview(title: "Register",
                       subtitle: "Become One Of Us",
                       angle: -15,
                       startcolor: .red,
                       endcolor: .yellow)
            Form{
                if !viewModel.errormessage.isEmpty{
                    Text(viewModel.errormessage)
                        .foregroundColor(.red)
                }
                TextField("Full Name", text: $viewModel.name)
                    .autocorrectionDisabled()
                TextField("Email Adress", text: $viewModel.email)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password)
                    .textInputAutocapitalization(.never)
                Button(action:{viewModel.register()}, label: {
                    //Login function
                    ZStack(content: {
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(.green)
                        Text("Creat Account")
                            .foregroundStyle(.white)
                            .bold()
                    })
                }).padding()
            }
            
            Spacer()

            
        })
        
    }
}

//#Preview {
    //RegisterView()
//}
