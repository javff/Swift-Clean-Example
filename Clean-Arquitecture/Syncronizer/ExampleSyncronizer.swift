//
//  ExampleSyncronizer.swift
//  Clean-Arquitecture
//
//  Created by Juan Andres Vasquez on 25/4/23.
//

import Foundation

protocol ExampleSyncronizer: AnyObject {
    var stateStore: ExampleStateStore { get }

    func activeSnyc()
    func desactiveSync()
}
