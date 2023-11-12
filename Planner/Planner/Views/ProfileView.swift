//
//  Profileview.swift
//  Planner
//
//  Created by csuftitan on 11/6/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView(content: {
            VStack{
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.blue)
                    .frame(width:125, height:125)
                //information of account
                VStack(alignment: .leading, content: {
                    HStack{
                        Text("Name: ")
                    }
                    HStack{
                        Text("Email: ")
                    }
                    HStack{
                        Text("Member Since: ")
                    }
                })
                
                //sign out button
                Button(action:{}, label: {
                    //Login function
                    ZStack(content: {
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(.red)
                        Text("Log Out")
                            .foregroundStyle(.white)
                            .bold()
                    })
                }).padding()
                    
                }
                    
            })
    }
}

#Preview {
    ProfileView()
}
