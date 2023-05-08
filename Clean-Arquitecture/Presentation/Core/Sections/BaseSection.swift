//
//  BaseSection.swift
//  JKListKit
//
//  Created by Juan vasquez on 21-02-22.
//

import Foundation

/// The identifier of a SectionController
public struct BaseSectionIdentifier: Equatable {

    /// String that represent id of the section
    public let id: String

    /// String that represent type of the section
    public let type: String


    /// Init of BaseSectionIdentifier
    /// - Parameters:
    ///   - id: String that represent id of the section
    ///   - type: String that represent type of the section
    public init(id: String, type: String) {
        self.id = id
        self.type = type
    }
}



/// The model that represent a SectionController
public struct BaseSectionData: Equatable {

    public let identifier: BaseSectionIdentifier
    public let data: DiffableModel


    /// Init of BaseSectionData
    /// - Parameters:
    ///   - identifier: A identifier object
    ///   - data: A diffableModel object
    public init(identifier: BaseSectionIdentifier, data: DiffableModel) {
        self.identifier = identifier
        self.data = data
    }

    public static func == (lhs: BaseSectionData, rhs: BaseSectionData) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}


