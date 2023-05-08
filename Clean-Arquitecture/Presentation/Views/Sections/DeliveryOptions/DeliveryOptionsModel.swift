//
//  DeliveryOptionsModelView.swift
//  Clean-Arquitecture
//
//  Created by Juan Andres Vasquez on 27/4/23.
//

import Foundation

struct DeliveryOptionsModel: DiffableModel {
    let selectedOption: DeliveryOptionModel
    let options: [DeliveryOptionModel]
}

struct DeliveryOptionModel: DiffableModel, Equatable {
    let id: String
    let title: String
    let kind: DeliveryOptionKindModel
}

enum DeliveryOptionKindModel {
    case home
    case dropoint
    case store
}
