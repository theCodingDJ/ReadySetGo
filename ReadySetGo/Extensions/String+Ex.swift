//
//  String+Ex.swift
//  ReadySetGo
//
//  Created by Lyubomir Marinov on 1.09.24.
//

import Foundation

extension String {
    /// 
    /// Validates the string length compared to a provided.
    /// - Tip: `self` is omitted because of my coding style.
    ///
    /// - Remark: There are many ways to achieve that. I chose to extract it as a method to use it in the ``CarInputView`` state update.
    ///
    /// ```Swift
    /// // So I will do this:
    /// isCarModelValid = carModel.validate()
    /// // Instead of this:
    /// isCarModelValid = carModel.count >= 3
    /// ```
    /// - Parameter minimumLength: The minimum amount of characters required for this string to be a valid one. Defaults to *3*.
    ///
    /// - Returns: `true` if the string lenght is greater than or equal to the required minimum.
    /// 
    public func isValid(minimumLength: Int = 3) -> Bool {
        count >= minimumLength
    }
}
