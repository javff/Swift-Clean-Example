//
//  ExampleViewActions.swift
//  Clean-Arquitecture
//
//  Created by Juan Andres Vasquez on 24/4/23.
//

import Foundation

enum ExampleViewActions {
    case renderView
    case tapRadioButton(id: String)
    case tapDeliveryOption(selected: DeliveryOptionModel, model: DeliveryOptionsModel, id: String)
}
