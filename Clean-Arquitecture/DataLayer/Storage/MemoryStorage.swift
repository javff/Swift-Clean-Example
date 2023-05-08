//
//  MemoryStorage.swift
//  Clean-Arquitecture
//
//  Created by Juan Andres Vasquez on 25/4/23.
//

import Foundation

protocol MemoryStorage: AnyObject {
    func save<T>(key: String, value: T)
    func get<T>(key: String) -> T?
}

final class MemoryStorageImpl: MemoryStorage {

    private var storage: [String: Any] = [:]
    func save<T>(key: String, value: T) {
        print("MemoryStorage - save legacy data model in local")
        storage[key] = value
    }

    func get<T>(key: String) -> T? {
        guard let value = storage[key] as? T else { return nil }
        return value
    }
}
