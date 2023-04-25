//
//  ExampleLocalStorageDataSource.swift
//  Clean-Arquitecture
//
//  Created by Juan Andres Vasquez on 25/4/23.
//

import Foundation

protocol ExampleLocalStorageDataSource: AnyObject {
    func saveLegacyOptions(_ options: [LegacyOptionModel])
}

final class ExampleLocalStorageDataSourceImpl: ExampleLocalStorageDataSource {

    private let localStorage: MemoryStorage

    init(localStorage: MemoryStorage) {
        self.localStorage = localStorage
    }

    func saveLegacyOptions(_ options: [LegacyOptionModel]) {
        localStorage.save(key: "some-key", value: options)
    }
}
