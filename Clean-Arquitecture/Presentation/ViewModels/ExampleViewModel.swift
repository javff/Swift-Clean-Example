//
//  ExampleViewModel.swift
//  Clean-Arquitecture
//
//  Created by Juan Andres Vasquez on 24/4/23.
//

import Foundation
import Combine

protocol ExampleViewModel: AnyObject {
    var viewState: AnyPublisher<ExampleViewState, Never> { get }

    func sendAction(_ action: ExampleViewActions)
}
