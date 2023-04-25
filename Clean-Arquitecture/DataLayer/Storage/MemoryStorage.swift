//
//  MemoryStorage.swift
//  Clean-Arquitecture
//
//  Created by Juan Andres Vasquez on 25/4/23.
//

import Foundation

protocol MemoryStorage: AnyObject {
    func save<T>(key: String, value: T)
    func get<T>(key: String) -> T
}

final class MemoryStorageImpl: MemoryStorage {
    func save<T>(key: String, value: T) {
        // nothing
        print("guardando data en local")
    }

    func get<T>(key: String) -> T {
        fatalError("not yet")
    }


}
