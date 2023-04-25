//
//  State.swift
//  Clean-Arquitecture
//
//  Created by Juan Andres Vasquez on 25/4/23.
//

import Foundation
import Combine

protocol ExampleStateStore: AnyObject {
    var statePublisher: AnyPublisher<ExampleDomainState, Never> { get }
}

