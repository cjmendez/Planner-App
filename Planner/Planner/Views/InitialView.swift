//
//  InitialView.swift
//  Planner
//
//  Created by csuftitan on 11/9/23.
//

import SwiftUI

struct InitialView: View {
    @State private var isActive: Bool = false

    var body: some View {
        if isActive {
            MainView()
        } else {
            GreetView()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        print("This line should be printed after 3 seconds")
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
        }
    }
}


#Preview {
    InitialView()
}
