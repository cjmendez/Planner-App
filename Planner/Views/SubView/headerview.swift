//
//  headerview.swift
//  Planner
//
//  Created by csuftitan on 11/7/23.
//

import SwiftUI

struct headerview: View {
    let title: String
    let subtitle: String
    let angle: Double
    let startcolor: Color
    let endcolor: Color
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [startcolor, endcolor]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                .border(Color.black, width: 5)
                .rotationEffect(Angle(degrees: angle))
                .offset(y:-140)
            
            VStack(content: {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundStyle(.white)
                    .bold()
                    .offset(y:-80)
                Text(subtitle)
                    .font(.system(size: 25))
                    .foregroundStyle(.white)
                    .bold()
                    .offset(y:-80)
            })
        }.frame(width:500, height:300)
    }
}

#Preview {
    headerview(title: "Title",
               subtitle: "Subtitle",
               angle: 15,
               startcolor: .red,
               endcolor: .blue)
}
