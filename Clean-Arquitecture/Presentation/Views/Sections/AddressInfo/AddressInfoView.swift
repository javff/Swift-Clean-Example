//
//  AddressInfoView.swift
//  Clean-Arquitecture
//
//  Created by Juan Andres Vasquez on 27/4/23.
//

import UIKit

final class AddressInfoView: UIView {

    private let model: AddressInfoModel

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        return stackView
    }()

    init(model: AddressInfoModel) {
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
        let imageView = UIImageView(image: UIImage(systemName: "arrow.forward"))
        imageView.contentMode = .right

        let label = UILabel()
        label.text = model.title

        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(UIView())
        stackView.addArrangedSubview(imageView)
    }
}

