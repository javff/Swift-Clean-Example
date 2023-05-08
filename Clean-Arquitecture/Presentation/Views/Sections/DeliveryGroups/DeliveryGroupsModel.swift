//
//  DeliveryGroupsModel.swift
//  Clean-Arquitecture
//
//  Created by Juan Andres Vasquez on 27/4/23.
//

import Foundation

struct DeliveryGroupsModel: DiffableModel {
    let title: String
    let groups: [DeliveryGroupModel]
}

struct DeliveryGroupModel: DiffableModel {
    let options: [DeliveryGroupOption]
    let imagesName: [String]
}

struct DeliveryGroupOption: DiffableModel {
    let id: String
    let text: String
    let isSelected: Bool
}
