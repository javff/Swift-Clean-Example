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

    private let tableView = UITableView()
    private var tableDataSource: MyDataSource?

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
        configureDataSource()
        view.backgroundColor = .red
        setupBindings()
        viewModel.sendAction(.renderView)
    }

    private func setupView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    func configureDataSource() {
        tableDataSource = MyDataSource(tableView: tableView, cellProvider: { tableView, indexPath, model in
            let cell = UITableViewCell()
            cell.textLabel?.text = model.description
            return cell
        })
        tableView.delegate = self
    }
}

extension ExampleViewController {
    func setupBindings() {
        viewModel
            .viewState
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
        print(state)
        switch state {
        case .void: break

        case .loading: break

        case .empty: break

        case .render(let sections):
            self.renderTable(sections: sections)
        case .error(let error):
            self.renderError(error)
        }
    }

    func renderTable(sections: [SectionModel]) {
        var initialSnapshot = NSDiffableDataSourceSnapshot<Int, SectionModel>()
        initialSnapshot.appendSections([0])
        initialSnapshot.appendItems(sections)
        tableDataSource?.apply(initialSnapshot, animatingDifferences: false)
    }

    func renderError(_ error: ViewError) {
//        Nothing yet
        print("Renderiza error")
    }
}

extension ExampleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let model = tableDataSource?.itemIdentifier(for: indexPath) else {
            return
        }
        viewModel.sendAction(.tapRadioButton(id: model.id))
    }
}
