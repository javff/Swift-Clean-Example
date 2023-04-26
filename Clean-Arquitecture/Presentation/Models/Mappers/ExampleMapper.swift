//
//  ExampleMapper.swift
//  Clean-Arquitecture
//
//  Created by Juan Andres Vasquez on 24/4/23.
//

import Foundation

protocol ExampleMapper: AnyObject {
    func transform(_ input: ExampleDomainModel) -> ExampleViewState
    func transformError(_ input: Error) -> ExampleViewState
}

final class ExampleMapperImpl: ExampleMapper {
    func transform(_ input: ExampleDomainModel) -> ExampleViewState {
        if input.options.isEmpty {
            return .empty
        }

        let sections: [SectionModel] = input.options.map {
            .init(id: "1", title: input.title, description: $0)
        }

        return .render(sections: sections)
    }

    func transformError(_ input: Error) -> ExampleViewState {
        return .error(.connectLost)
    }
}
