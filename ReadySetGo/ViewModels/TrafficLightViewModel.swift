//
//  TrafficLightViewModel.swift
//  ReadySetGo
//
//  Created by Lyubomir Marinov on 1.09.24.
//

import SwiftUI

//@MainActor
class TrafficLightViewModel: ObservableObject {

    @Published var currentSignal: TrafficLightSignalization = ClassicTrafficLights.red
    private var timer: Timer?
   
    private func updateSignal() {
        switch currentSignal.identifier {
        case .red:
            currentSignal = ClassicTrafficLights.green
        case .green:
            currentSignal = ClassicTrafficLights.orange
        case .orange:
            currentSignal = ClassicTrafficLights.red
        }
        
        updateTimer(duration: currentSignal.duration)
    }
    
    private func updateTimer(duration: TimeInterval) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: duration, repeats: false) { [weak self] _ in
            self?.updateSignal()
        }
    }
    
    func startTrafficSignaling() {
        updateTimer(duration: currentSignal.duration)
    }
    
    func stopTrafficSignaling() {
        timer?.invalidate()
    }

    deinit {
        stopTrafficSignaling()
    }
}
