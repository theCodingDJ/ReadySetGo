//
//  TrafficLightSignalization.swift
//  ReadySetGo
//
//  Created by Lyubomir Marinov on 1.09.24.
//

import Foundation


/// 
/// The Traffic light signalization outlines the structure of a traffic signal that we are gonna show to the user.
///
/// - Note: Even though I can use an enum with three cases for each signal `|🔴|🟡|🟢|`  and add some computed variables,
/// I defined a struct that holds the necessary data, instead.
///
/// - Remark: This gives more freedom in terms of having other types of traffic lights (e.g. pedestrian lights, or tram lights)
///
/// - Parameter identifier: Identifies the signal. A generic that can represent a `RawRepresentable` type, such as enums.
/// - Parameter duration: The duration of signal being on.
///
struct TrafficLightSignalization<SignalIdentifierType: RawRepresentable> where SignalIdentifierType.RawValue == String {
    let identifier: SignalIdentifierType
    let duration: TimeInterval
}

extension TrafficLightSignalization: Equatable {
    static func == (lhs: TrafficLightSignalization, rhs: TrafficLightSignalization) -> Bool {
        type(of: lhs.identifier) == type(of: rhs.identifier)
        && lhs.identifier.rawValue == rhs.identifier.rawValue
        && lhs.duration == rhs.duration
    }
}
