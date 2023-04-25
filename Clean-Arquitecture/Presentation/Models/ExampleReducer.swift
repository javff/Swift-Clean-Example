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
            return .reloadInfo(id)
        case .select:
            return .loadNewInfo
        case .removeGiftCard:
            return .loadNewInfo
        }
    }
}
