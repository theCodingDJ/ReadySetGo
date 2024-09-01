//
//  TrafficLightView.swift
//  ReadySetGo
//
//  Created by Lyubomir Marinov on 1.09.24.
//

import SwiftUI

struct TrafficLightView: View {
    var color: Color
    var isActive: Bool

    var body: some View {
        Circle()
            .fill(isActive ? color : color.opacity(0.3))
            .frame(width: 100, height: 100)
            .padding()
            .animation(.easeInOut, value: isActive)
    }
}

#Preview {
    TrafficLightView(color: .red, isActive: true)
}
