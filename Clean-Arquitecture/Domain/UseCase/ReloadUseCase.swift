//
//  ReloadUseCase.swift
//  Clean-Arquitecture
//
//  Created by Juan Andres Vasquez on 24/4/23.
//

import Foundation
import Combine

protocol ReloadUseCase: AnyObject {
    func execute(id: String) -> AnyPublisher<ExampleDomainModel, Error>
}

final class ReloadUseCaseImpl: ReloadUseCase {
    func execute(id: String) -> AnyPublisher<ExampleDomainModel, Error> {
        return Just<ExampleDomainModel>(
            .init(
                id: id,
                title: "Titulo Principal",
                options: ["data recargada Option1", "data recargada Option2", "Option3"],
                price: 25
            )
        )
        .setFailureType(to: Error.self)
        .eraseToAnyPublisher()
    }
}
