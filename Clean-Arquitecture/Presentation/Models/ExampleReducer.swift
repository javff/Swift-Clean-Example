//
//  ExampleReducer.swift
//  Clean-Arquitecture
//
//  Created by Juan Andres Vasquez on 24/4/23.
//

import Foundation

protocol ExampleActionReducer: AnyObject {
    func reduce(_ action: ExampleViewActions, state: inout ExampleViewState) -> ExampleEffects
}

final class ExampleActionReducerImpl: ExampleActionReducer {
    func reduce(_ action: ExampleViewActions, state: inout ExampleViewState) -> ExampleEffects {
        switch action {
        case .renderView:
            state = .loading
            return .loadNewInfo
        case .tapRadioButton(let id):
            state = .loading
            return .reloadInfo(id)
        case let .tapDeliveryOption(selected: option, model: model, id: identifier):
            let newModel = DeliveryOptionsModel(
                selectedOption: option,
                options: model.options
            )
            let newSection = BaseSectionData(
                identifier: BaseSectionIdentifier(id: identifier, type: SectionType.deliveryOptions.rawValue),
                data: newModel
            )
            state = .update(section: newSection)
            return .openOption(option.kind)
        }
    }
}
