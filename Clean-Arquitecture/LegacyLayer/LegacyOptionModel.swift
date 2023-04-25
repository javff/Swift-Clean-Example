//
//  LegacyOptionModel.swift
//  Clean-Arquitecture
//
//  Created by Juan Andres Vasquez on 25/4/23.
//

import Foundation

final class LegacyOptionModel {
    var optionId: String?
    var name: String?
    var price: Double?

    init(optionId: String?, name: String?, price: Double?) {
        self.optionId = optionId
        self.name = name
        self.price = price
    }
}
