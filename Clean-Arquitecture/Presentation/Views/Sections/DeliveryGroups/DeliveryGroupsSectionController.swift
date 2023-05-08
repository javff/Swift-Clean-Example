//
//  DeliveryGroupsSectionController.swift
//  Clean-Arquitecture
//
//  Created by Juan Andres Vasquez on 27/4/23.
//

import Foundation

final class DeliveryGroupsSectionController: BaseSectionController<DeliveryGroupsModel, DeliveryGroupsView> {

    override func createSection(in listView: ListView, model: DeliveryGroupsModel) -> DeliveryGroupsView {
        let view = DeliveryGroupsView(model: model)
        return view
    }

}
