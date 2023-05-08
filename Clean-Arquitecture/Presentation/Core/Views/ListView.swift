//
//  ListView.swift
//  JKListKit
//
//  Created by Juan vasquez on 17-02-22.
//

import Foundation
import UIKit

protocol ListViewProtocol: AnyObject {
    func loadSections(_ sections: [BaseSectionData])
    func updateSection(_ section: BaseSectionData)
    func appendSection(_ section: BaseSectionData)
    func insertSection(_ section: BaseSectionData, at index: Int)
}


/// A UI component that makes it easy to create complex layouts based on sections.
public final class ListView: UIView {

    lazy var containerView: ContainerView = {
        let view = ContainerView(configuration: configuration)
        return view
    }()

    var contentHeight: CGFloat {
        return containerView.scrollView.contentSize.height
    }

    var frameHeight: CGFloat {
        return bounds.height
    }

    var contentOffsetY: CGFloat = .zero
    var contentOffsetChanged: ((CGFloat) -> Void)?
    private let configuration: ListViewConfiguration

    /// Value of resistence before starting to load more sections.
    public var scrollLoadResistence: CGFloat = 100

    /// Number of sections to load when ListView needed load more sections.
    public var preloadSections = 2

    /// Init of ListView
    /// - Parameter configuration: ListViewConfiguration that configure initial insets and paddings.
    public init(configuration: ListViewConfiguration) {
        self.configuration = configuration
        super.init(frame: .zero)
        setupView()
        setupConstraint()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        addSubview(containerView)
    }

    private func setupConstraint() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
