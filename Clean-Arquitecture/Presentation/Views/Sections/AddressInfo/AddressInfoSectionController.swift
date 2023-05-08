//
//  AddressInfoSectionController.swift
//  Clean-Arquitecture
//
//  Created by Juan Andres Vasquez on 27/4/23.
//

import Foundation

final class AddressInfoSectionController: BaseSectionController<AddressInfoModel, AddressInfoView> {

    override func createSection(in listView: ListView, model: AddressInfoModel) -> AddressInfoView {
        let view = AddressInfoView(model: model)
        return view
    }

}
