//
//  ClassicTrafficLights.swift
//  ReadySetGo
//
//  Created by Lyubomir Marinov on 1.09.24.
//

import Foundation

/// Identifier for the classic traffic signals.
enum ClassicSignalIdentifier: String {
    case red
    case orange
    case green
}

///
/// Represents the classic traffic light signals.
///
/// - Tip: Even tho there are no cases in this `enum` it is useful in this situation because it holds static constants, but doesn't have a constructor.
///
enum ClassicTrafficLights {
    static let red = TrafficLightSignalization(identifier: ClassicSignalIdentifier.red, duration: 4)
    static let orange = TrafficLightSignalization(identifier: ClassicSignalIdentifier.orange, duration: 1)
    static let green = TrafficLightSignalization(identifier: ClassicSignalIdentifier.green, duration: 4)
}
