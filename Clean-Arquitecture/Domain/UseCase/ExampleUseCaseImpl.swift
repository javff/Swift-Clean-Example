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

    init(repository: OptionsRepository) {
        self.repository = repository
    }

    func execute() -> AnyPublisher<ExampleDomainModel, Error> {
        return repository
            .getOptions()
            .eraseToAnyPublisher()
    }
}
