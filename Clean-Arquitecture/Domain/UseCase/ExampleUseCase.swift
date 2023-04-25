//
//  ExampleUseCase.swift
//  Clean-Arquitecture
//
//  Created by Juan Andres Vasquez on 24/4/23.
//

import Foundation
import Combine

protocol ExampleUseCase: AnyObject {
    func execute() -> AnyPublisher<ExampleDomainModel, Error>
}
