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

        let sections = buildRenderLayout()
        return .render(sections: sections)
    }

    private func buildRenderLayout() -> [BaseSectionData] {
        let selectedOption = DeliveryOptionModel(id: UUID().uuidString, title: "home", kind: .home)
        let deliveryOptions = BaseSectionData(
            identifier: BaseSectionIdentifier(id: SectionType.deliveryOptions.rawValue, type: SectionType.deliveryOptions.rawValue),
            data: DeliveryOptionsModel(
                selectedOption: selectedOption,
                options: [
                    selectedOption,
                    .init(id: UUID().uuidString, title: "dropoint",  kind: .dropoint),
                    .init(id: UUID().uuidString, title: "Store",     kind: .store   )
                ])
        )

        let addressInfo = BaseSectionData(
            identifier: BaseSectionIdentifier(id: SectionType.addressInfo.rawValue, type: SectionType.addressInfo.rawValue),
            data: AddressInfoModel(title: "Madrid")
        )

        let deliveryGroups =  BaseSectionData(
            identifier: BaseSectionIdentifier(id: SectionType.deliveryGroups.rawValue, type: SectionType.deliveryGroups.rawValue),
            data: DeliveryGroupsModel(title: "Items", groups: [
                .init(
                    options: [
                        .init(id: "1", text: "today 02, may 19:55", isSelected: false),
                        .init(id: "2", text: "Monday 17, May 7:95 TL", isSelected: true),
                        .init(id: "3", text: "Friday 22, May 7:95 TL", isSelected: false),
                    ],
                    imagesName: ["tshirt.fill", "tshirt.fill", "tshirt.fill"]
                ),
                .init(
                    options: [
                        .init(id: "1", text: "today 03, may 19:55", isSelected: true),
                        .init(id: "2", text: "Monday 25, May 7:95 TL", isSelected: false),
                        .init(id: "3", text: "Friday 28, May 7:95 TL", isSelected: false),
                    ],
                    imagesName: ["tshirt", "tshirt", "tshirt"]
                )
            ]
            )
        )

        return [
            deliveryOptions,
            addressInfo,
            deliveryGroups
        ]
    }

    func transformError(_ input: Error) -> ExampleViewState {
        return .error(.connectLost)
    }
}
