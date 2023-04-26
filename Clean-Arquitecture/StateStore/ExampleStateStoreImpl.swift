//
//  ExampleStateStoreImpl.swift
//  Clean-Arquitecture
//
//  Created by Juan Andres Vasquez on 25/4/23.
//

import Foundation
import Combine

final class ExampleStateStoreImpl: ExampleStateStore {

    var statePublisher: AnyPublisher<ExampleDomainState, Never> {
        return $state.eraseToAnyPublisher()
    }

    @Published var state: ExampleDomainState

    init(state: ExampleDomainState) {
        self.state = state
    }
}
