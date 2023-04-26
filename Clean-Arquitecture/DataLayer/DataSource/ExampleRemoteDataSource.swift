//
//  ExampleRemoteDataSource.swift
//  Clean-Arquitecture
//
//  Created by Juan Andres Vasquez on 25/4/23.
//

import Foundation
import Combine

protocol ExampleRemoteDataSource: AnyObject {
    func getLegacyOption() -> AnyPublisher<[LegacyOptionModel], Error>
}

final class ExampleRemoteDataSourceImpl: ExampleRemoteDataSource {
    func getLegacyOption() -> AnyPublisher<[LegacyOptionModel], Error> {
        let data: [LegacyOptionModel] = [
            .init(optionId: "1", name: "name1", price: 1),
            .init(optionId: "2", name: "name2", price: 2),
            .init(optionId: nil, name: "name3", price: nil)
        ]

        return Just<[LegacyOptionModel]>(data)
            .setFailureType(to: Error.self)
            .delay(for: .seconds(3), scheduler: DispatchQueue.main)
            .map(interceptAfterDelay)
            .eraseToAnyPublisher()
    }

    private func interceptAfterDelay(_ input: [LegacyOptionModel]) -> [LegacyOptionModel] {
        print("RemoteDataSource - Return data")
        return input
    }
}
