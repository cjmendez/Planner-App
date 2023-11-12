//
//  Loginview.swift
//  Planner
//
//  Created by csuftitan on 11/6/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView(content: {
            VStack{
                //header
                headerview(title: "Calm Mind",
                           subtitle: "Get Things Done",
                           angle: 15,
                           startcolor: .red,
                           endcolor: .blue)
                Spacer()
                //Login form
                
                Form {
                    if !viewModel.errormessage.isEmpty{
                        Text(viewModel.errormessage)
                            .foregroundColor(.red)
                    }
                    TextField("Email Address", text: $viewModel.email)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                    SecureField("Password", text: $viewModel.password)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                    Button(action:{viewModel.login()}, label: {
                        //Login function
                        ZStack(content: {
                            RoundedRectangle(cornerRadius: 25)
                            Text("Log In")
                                .foregroundStyle(.white)
                                .bold()
                        })
                    }).padding()
                }
                //create form
                VStack{
                    Text("First Time Here?")
                        .font(.system(size: 20))
                    NavigationLink("Create An Account", destination: RegisterView())
                        .font(.system(size:15))
                }.padding(.bottom,30)
                
            }
        })
    }
}

#Preview {
    LoginView()
}
