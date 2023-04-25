//
//  OptionsRepositoryImpl.swift
//  Clean-Arquitecture
//
//  Created by Juan Andres Vasquez on 25/4/23.
//

import Foundation
import Combine

final class OptionsRepositoryImpl: OptionsRepository {

    private let remoteDataSource: ExampleRemoteDataSource
    private let localDataSource: ExampleLocalStorageDataSource
    private let mapper: OptionsMapper
    private var cancellables = Set<AnyCancellable>()

    init(remoteDataSource: ExampleRemoteDataSource,
         localDataSource: ExampleLocalStorageDataSource,
         mapper: OptionsMapper) {
        self.localDataSource = localDataSource
        self.remoteDataSource = remoteDataSource
        self.mapper = mapper
    }
    
    func getOptions() -> AnyPublisher<ExampleDomainModel, Error> {
        return remoteDataSource
            .getLegacyOption()
            .map(saveInLocal)
            .map(mapper.transform)
            .eraseToAnyPublisher()
    }

    private func saveInLocal(_ legacyOptions: [LegacyOptionModel]) -> [LegacyOptionModel] {
        localDataSource.saveLegacyOptions(legacyOptions)
        return legacyOptions
    }
}
