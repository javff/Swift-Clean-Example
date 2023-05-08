//
//  ViewState.swift
//  Clean-Arquitecture
//
//  Created by Juan Andres Vasquez on 24/4/23.
//

import Foundation

enum ExampleViewState: Equatable {
    case void
    case loading
    case empty
    case error(_ error: ViewError)
    case render(sections: [BaseSectionData])
    case update(section: BaseSectionData)

    static func == (lhs: ExampleViewState, rhs: ExampleViewState) -> Bool {
        switch (lhs, rhs) {
        case (.void, .void),
             (.loading, .loading),
             (.empty, .empty):
            return true
        case let (.error(lhsError), .error(rhsError)):
            return lhsError == rhsError
        case let (.render(lhsSections), .render(rhsSections)):
            return lhsSections == rhsSections
        default:
            return false
        }
    }
}

enum ViewError: Error {
    case connectLost
    case failureParams
    case unkown
}
