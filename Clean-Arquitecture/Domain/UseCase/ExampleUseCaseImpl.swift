//
//  ExampleUseCaseImpl.swift
//  Clean-Arquitecture
//
//  Created by Juan Andres Vasquez on 24/4/23.
//

import Foundation
import Combine

final class ExampleUseCaseImpl: ExampleUseCase {

    private let repository: OptionsRepository
    private var stateStore: ExampleStateStore

    init(repository: OptionsRepository,
         stateStore: ExampleStateStore) {
        self.repository = repository
        self.stateStore = stateStore
    }

    func execute() -> AnyPublisher<ExampleDomainModel, Error> {
        return repository
            .getOptions()
            .map(updateDelivery)
            .eraseToAnyPublisher()
    }

    private func updateDelivery(_ input: ExampleDomainModel) -> ExampleDomainModel {
        print("UseCase access and modified global flow state")
        stateStore.state.selectedOptions = input.options
        return input
    }
}
