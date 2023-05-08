//
//  DeliveryGroupsVeiw.swift
//  Clean-Arquitecture
//
//  Created by Juan Andres Vasquez on 27/4/23.
//

import UIKit

final class DeliveryGroupsView: UIView {

    private let model: DeliveryGroupsModel

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 16
        return stackView
    }()


    init(model: DeliveryGroupsModel) {
        self.model = model
        super.init(frame: .zero)
        setupView()
        setupConstraints()
        configureView()
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

    private func configureView() {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.text = model.title

        stackView.addArrangedSubview(label)

        model.groups.forEach {
            let view = makeGroupView($0)
            stackView.addArrangedSubview(view)
        }
    }

    private func makeGroupView(_ model: DeliveryGroupModel) -> UIView {

        let containerView = UIStackView()
        containerView.axis = .vertical
        containerView.spacing = 16

        let imageStackView = UIStackView()
        imageStackView.axis = .horizontal
        imageStackView.distribution = .fill
        imageStackView.spacing = 8

        let optionsStackView = UIStackView()
        optionsStackView.axis = .vertical
        optionsStackView.distribution = .fill
        optionsStackView.spacing = 8

        model.imagesName.forEach {
            let imageView = UIImageView(image: UIImage(systemName: $0))
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageStackView.addArrangedSubview(imageView)
            imageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        }

        imageStackView.addArrangedSubview(UIView())

        model.options.forEach {
            let label = UILabel()
            label.font = $0.isSelected ? .boldSystemFont(ofSize: 14) : .systemFont(ofSize: 14)
            label.text = $0.text
            optionsStackView.addArrangedSubview(label)
        }

        containerView.addArrangedSubview(imageStackView)
        containerView.addArrangedSubview(optionsStackView)
        return containerView
    }
}
