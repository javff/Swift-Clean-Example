//
//  ExampleLocalDataSource.swift
//  Clean-Arquitecture
//
//  Created by Juan Andres Vasquez on 25/4/23.
//

import Foundation
import Combine

protocol ExampleLocalDataSource: AnyObject {
    func getLegacyOption() -> AnyPublisher<[LegacyOptionModel], Error>
}

final class ExampleLocalDataSourceImpl: ExampleLocalDataSource {
    private let localStorage: MemoryStorage

    enum CustomError: Error {
        case notFound
    }

    init(localStorage: MemoryStorage) {
        self.localStorage = localStorage
    }

    func getLegacyOption() -> AnyPublisher<[LegacyOptionModel], Error> {
        guard let data: [LegacyOptionModel] = localStorage.get(key: "some-key") else {
            return Fail(error: CustomError.notFound).eraseToAnyPublisher()
        }

        return Just<[LegacyOptionModel]>(data)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
