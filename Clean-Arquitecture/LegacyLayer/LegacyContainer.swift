//
//  LegacyLayer.swift
//  Clean-Arquitecture
//
//  Created by Juan Andres Vasquez on 25/4/23.
//

import Foundation

protocol LegacyContainer: AnyObject {
    var selectedOptions: [String] { get }
    func saveSelectedOptions(options: [LegacyOptionModel])

    func clearSomeParams()
    func resetSomeValues()
}
