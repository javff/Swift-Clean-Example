//
//  ExampleViewController.swift
//  Clean-Arquitecture
//
//  Created by Juan Andres Vasquez on 24/4/23.
//

import UIKit
import Combine

final class ExampleViewController: UIViewController {

    private let viewModel: ExampleViewModel
    private var cancellables = Set<AnyCancellable>()

    lazy var adapter: ListAdapter = {
        let factory = SectionFactory(
            responder: viewModel
        )
        let adapter = ListAdapter(sectionTypeFactory: factory)
        return adapter
    }()

    let listView: ListView = {
        let view = ListView(configuration: .init(spacing: 30, lateralSpacing: 15))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let activityView: UIActivityIndicatorView = {
        let activityView = UIActivityIndicatorView(style: .large)
        activityView.translatesAutoresizingMaskIntoConstraints = false
        return activityView
    }()

    init(viewModel: ExampleViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupListView()
        setupBindings()
        viewModel.sendAction(.renderView)
    }

    private func setupView() {
        view.backgroundColor = .systemBackground
        view.addSubview(listView)
        view.addSubview(activityView)
        NSLayoutConstraint.activate([
            listView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            listView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            listView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            listView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            activityView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    private func setupListView() {
        adapter.listView = listView
    }
}

extension ExampleViewController {
    func setupBindings() {
        viewModel
            .viewState
            .removeDuplicates()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] state in
                guard let self = self else { return }
                self.renderState(state: state)
            }
            .store(in: &cancellables)
        
    }
}

// MARK: - Update UI
extension ExampleViewController {
    func renderState(state: ExampleViewState) {
        print("View render state: \(state)")
        switch state {
        case .void: break

        case .loading:
            activityView.startAnimating()

        case .empty: break

        case .render(let sections):
            activityView.stopAnimating()
            self.adapter.loadSections(sections)
        case .error(let error):
            self.renderError(error)
        case .update(section: let section):
            activityView.stopAnimating()
            self.adapter.updateSection(section)
        }
    }

    func renderError(_ error: ViewError) {
//        Nothing yet
        print("Renderiza error")
    }
}
