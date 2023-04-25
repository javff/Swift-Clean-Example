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
        return $domainState.eraseToAnyPublisher()
    }

    @Published private(set) var domainState: ExampleDomainState

    init(domainState: ExampleDomainState) {
        self.domainState = domainState
    }
}
