//
//  LegacyImpl.swift
//  Clean-Arquitecture
//
//  Created by Juan Andres Vasquez on 25/4/23.
//

import Foundation

final class LegacyImpl {
    var options: [LegacyOptionModel] = [
        LegacyOptionModel(optionId: "1", name: "test1", price: 1),
        LegacyOptionModel(optionId: "2", name: "test2", price: 2),
        LegacyOptionModel(optionId: "3", name: "test3", price: 3)
    ]

    var calculatedOptions: [String] {
        return options.compactMap { $0.optionId }
    }

    var calculatedOptionsName: [String] {
        return options.compactMap { $0.name }
    }
}

extension LegacyImpl: LegacyContainer {

    var selectedOptions: [String] {
        return calculatedOptions
    }

    func saveSelectedOptions(options: [LegacyOptionModel]) {
        self.options = options
    }

    func clearSomeParams() {
        print("Clear some params")
    }

    func resetSomeValues() {
        print("reset some values")
    }
}
