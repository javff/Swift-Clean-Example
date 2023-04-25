//
//  OptionsRepository.swift
//  Clean-Arquitecture
//
//  Created by Juan Andres Vasquez on 25/4/23.
//

import Foundation
import Combine

protocol OptionsRepository: AnyObject {
    func getOptions() -> AnyPublisher<ExampleDomainModel, Error>
}
