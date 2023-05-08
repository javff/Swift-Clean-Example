//
//  SectionFactory.swift
//  Clean-Arquitecture
//
//  Created by Juan Andres Vasquez on 27/4/23.
//

import Foundation

/// The class that handles the section creation logic
final public class SectionFactory: SectionTypeFactoryProtocol {

    private let responder: ExampleViewModel

    /// Init of SectionTypeFactory
    /// - Parameter availableSectionTypes: A dictionary that represents the ids of the SectionTypes availables to render
    init(responder: ExampleViewModel) {
        self.responder = responder
    }

    /// Return a BaseSectionControllerProtocol given a BaseSectionIdentifierProtocol
    /// - Parameter section: The section model identifier instance
    /// - Returns: The baseSectionController instance that conform BaseSectionControllerProtocol and match with the identifier model
    public func create(section: BaseSectionIdentifier) -> BaseSectionControllerProtocol? {
        guard let sectionType = SectionType(rawValue: section.type) else { return nil }
        switch sectionType {
        case .addressInfo:
            return AddressInfoSectionController(section: section)
        case .deliveryOptions:
            return DeliveryOptionsSectionController(section: section, viewModel: responder)
        case .deliveryGroups:
            return DeliveryGroupsSectionController(section: section)
        }
    }
}
