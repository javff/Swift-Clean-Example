//
//  DeliveryOptionsSectionController.swift
//  Clean-Arquitecture
//
//  Created by Juan Andres Vasquez on 27/4/23.
//

import UIKit

typealias DeliveryOptionsTypeSectionController = BaseSectionController<DeliveryOptionsModel, DeliveryOptionsView>

final class DeliveryOptionsSectionController: DeliveryOptionsTypeSectionController {

    private let viewModel: ExampleViewModel

    init(section: BaseSectionIdentifier, viewModel: ExampleViewModel) {
        self.viewModel = viewModel
        super.init(section: section)
    }

    required public init(section: BaseSectionIdentifier) {
        fatalError("init(section:) has not been implemented")
    }

    override func createSection(in listView: ListView, model: DeliveryOptionsModel) -> DeliveryOptionsView {
        let view = DeliveryOptionsView()
        view.delegate = self
        return view
    }

    override func updateSection(listView: ListView, in view: DeliveryOptionsView, model: DeliveryOptionsModel) {
        view.configure(model: model)
    }
}

extension DeliveryOptionsSectionController: DeliveryOptionsViewDelegate {
    func didSelect(_ view: DeliveryOptionsView, selected element: DeliveryOptionModel, in model: DeliveryOptionsModel) {
        guard element != model.selectedOption else { return }
        viewModel.sendAction(.tapDeliveryOption(selected: element, model: model, id: section.id))
    }
}
