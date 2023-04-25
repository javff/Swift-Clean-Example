//
//  ViewState.swift
//  Clean-Arquitecture
//
//  Created by Juan Andres Vasquez on 24/4/23.
//

import Foundation

enum ExampleViewState {
    case void
    case loading
    case empty
    case error(_ error: ViewError)
    case render(sections: [SectionModel])
}

enum ViewError: Error {
    case connectLost
    case failureParams
    case unkown
}
