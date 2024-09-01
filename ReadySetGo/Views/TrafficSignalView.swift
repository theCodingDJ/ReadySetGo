//
//  TrafficSignalView.swift
//  ReadySetGo
//
//  Created by Lyubomir Marinov on 1.09.24.
//

import SwiftUI

struct TrafficSignalView: View {
    
    @Binding var currentSignal: TrafficLightSignalization<ClassicSignalIdentifier>
    
    var body: some View {
        VStack {
            TrafficLightView(color: .red, isActive: currentSignal.identifier == .red)
                .accessibilityIdentifier("RedSignal")
            
            TrafficLightView(color: .orange, isActive: currentSignal.identifier == .orange)
                .accessibilityIdentifier("OrangeSignal")
            
            TrafficLightView(color: .green, isActive: currentSignal.identifier == .green)
                .accessibilityIdentifier("GreenSignal")
            
            Spacer()
        }
        .padding()
        .accessibilityIdentifier("TrafficSignalView")
    }
}

#Preview {
    TrafficSignalView(currentSignal: .constant(TrafficLightSignalization(identifier: .green, duration: 4)))
}
