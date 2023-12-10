//
//  InitialViewViewModel.swift
//  Planner
//
//  Created by csuftitan on 11/9/23.
//

import SwiftUI

struct InitialViewViewModel: View {
    @State private var isActive: Bool = false

    var body: some View {
        if isActive {
            MainView()
        } else {
            GreetView() // 你的启动画面视图
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
        }
    }
}

#Preview {
    InitialViewViewModel()
}
