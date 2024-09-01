//
//  CarModelInputView.swift
//  ReadySetGo
//
//  Created by Lyubomir Marinov on 1.09.24.
//

import SwiftUI

struct CarModelInputView: View {
    @State private var carModel: String = ""
    @State private var isCarModelInvalid: Bool = false
    @State private var shouldStartDriving: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 8) {
                TextField("Car Model", text: $carModel)
                    .padding(8)
                    .border(Color.gray)
                    .accessibilityIdentifier("CarModelTextField")
                
                Text("At least 3 characters.")
                    .font(.caption2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(Color.gray)
                    .padding(.bottom, 8) /// Adds spacing between the button and the text field.

                Button(action: {
                    guard carModel.isValid() else {
                        isCarModelInvalid = true
                        return
                    }
                    shouldStartDriving = true
                }, label: {
                    Label("Start Driving", systemImage: "steeringwheel")
                        .padding(.horizontal, 8)
                        .font(.headline)
                })
                .padding(8)
                .background(Color.blue)
                .foregroundStyle(.white)
                .accessibilityIdentifier("CarModelSubmitButton")
                
                Spacer()
            }
            .padding()
            .navigationDestination(isPresented: $shouldStartDriving, destination: {
                StartDrivingView(carModel: carModel)
            })
            .navigationTitle("Enter your car model")
            .navigationBarTitleDisplayMode(.inline)
        }
        .alert("Error", isPresented: $isCarModelInvalid, actions: {
            Button("Close") {
                isCarModelInvalid = false
            }
        }, message: {
            Text("Car model is not long enough.")
        })
    }
}

#Preview {
    CarModelInputView()
}
