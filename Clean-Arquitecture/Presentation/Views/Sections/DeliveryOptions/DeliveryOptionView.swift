//
//  DeliveryOptionView.swift
//  Clean-Arquitecture
//
//  Created by Juan Andres Vasquez on 3/5/23.
//

import UIKit

final class DeliveryOptionView: UIView {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(model: DeliveryOptionModel, selected: Bool) {
        label.text = model.title

        let color = selected ? UIColor.black.cgColor : UIColor.lightGray.cgColor
        let font = selected ? UIFont.boldSystemFont(ofSize: 14) : UIFont.systemFont(ofSize: 14)
        let imageName = getImageForKind(model.kind, selected: selected)

        label.font = font
        imageView.image = UIImage(systemName: imageName)
        layer.borderColor = color
    }

    private func setupView() {
        addSubview(imageView)
        addSubview(label)

        layer.borderWidth = 0.5
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            imageView.widthAnchor.constraint(equalToConstant: 40),
            imageView.heightAnchor.constraint(equalToConstant: 40),

            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4)
        ])
    }

    private func getImageForKind(_ kind: DeliveryOptionKindModel, selected: Bool) -> String {
        var name = ""
        switch kind {
        case .home:
            name = "house"
        case .dropoint:
            name = "drop.circle"
        case .store:
            name = "shippingbox"
        }
        return selected ? "\(name).fill" : name
    }
}
