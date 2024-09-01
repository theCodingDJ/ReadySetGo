//
//  StartDrivingView.swift
//  ReadySetGo
//
//  Created by Lyubomir Marinov on 1.09.24.
//

import SwiftUI

import SwiftUI

struct StartDrivingView: View {
    let carModel: String
    @StateObject private var viewModel = TrafficLightViewModel()

    var body: some View {
        TrafficSignalView(currentSignal: $viewModel.currentSignal)
        .navigationTitle("Car Model: \(carModel)")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.startTrafficSignaling()
        }
    }
}

struct TrafficLightView_Previews: PreviewProvider {
    static var previews: some View {
        StartDrivingView(carModel: "Lamborghini")
    }
}
