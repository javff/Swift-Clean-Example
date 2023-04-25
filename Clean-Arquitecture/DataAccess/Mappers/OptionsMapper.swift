//
//  OptionsMapper.swift
//  Clean-Arquitecture
//
//  Created by Juan Andres Vasquez on 25/4/23.
//

import Foundation

protocol OptionsMapper: AnyObject {
    func transform(_ input: [LegacyOptionModel]) -> ExampleDomainModel
}

final class OptionsMapperImpl: OptionsMapper {
    func transform(_ input: [LegacyOptionModel]) -> ExampleDomainModel {
        return .init(id: "test", title: "test", options: ["hello world !!"], price: 1)
    }
}
