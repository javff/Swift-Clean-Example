//
//  ExampleState.swift
//  Clean-Arquitecture
//
//  Created by Juan Andres Vasquez on 25/4/23.
//

import Foundation

struct ExampleDomainState {
    let currentId: Int
    let mode: Mode
    var selectedOptions: [String]
}

enum Mode {
    case store
    case pay
    case repay
}
