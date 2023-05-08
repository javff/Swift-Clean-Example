//
//  DeliveryOptionsView.swift
//  Clean-Arquitecture
//
//  Created by Juan Andres Vasquez on 27/4/23.
//

import UIKit

protocol DeliveryOptionsViewDelegate: AnyObject {
    func didSelect(_ view: DeliveryOptionsView, selected element: DeliveryOptionModel, in model: DeliveryOptionsModel)
}

final class DeliveryOptionsView: UIView {

    weak var delegate: DeliveryOptionsViewDelegate?

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        addSubview(stackView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func configure(model: DeliveryOptionsModel) {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

        model.options.forEach { element in
            // create a view //
            let optionView = DeliveryOptionView()
            let isSelected = element == model.selectedOption

            // configure view and handle tap //
            optionView.configure(model: element, selected: isSelected)

            optionView.addTapGesture { [weak self] in
                guard let self = self else { return }
                self.delegate?.didSelect(self, selected: element, in: model)
            }

            // add subview
            stackView.addArrangedSubview(optionView)
        }
    }
}

