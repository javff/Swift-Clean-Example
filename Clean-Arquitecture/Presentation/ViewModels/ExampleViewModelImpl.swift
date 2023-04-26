//
//  ExampleViewModelImpl.swift
//  Clean-Arquitecture
//
//  Created by Juan Andres Vasquez on 24/4/23.
//

import Foundation
import Combine

final class ExampleViewModelImpl: ExampleViewModel {

    var viewState: AnyPublisher<ExampleViewState, Never> {
        return $statePublished.eraseToAnyPublisher()
    }

    @Published private(set) var statePublished: ExampleViewState = .void

    //    MARK: - Dependencies
    private let reducer: ExampleActionReducer
    private let mapper: ExampleMapper
    private let loadUseCase: ExampleUseCase
    private let reloadUseCase: ReloadUseCase
    private var cancellables = Set<AnyCancellable>()

    init(reducer: ExampleActionReducer,
         mapper: ExampleMapper,
         loadUseCase: ExampleUseCase,
         reloadUseCase: ReloadUseCase) {
        self.reducer = reducer
        self.loadUseCase = loadUseCase
        self.reloadUseCase = reloadUseCase
        self.mapper = mapper
    }

    func sendAction(_ action: ExampleViewActions) {
        let sideEffect = reducer.reduce(action, state: &statePublished)

        switch sideEffect {
        case .loadNewInfo:
            self.loadScreen()
            
        case .reloadInfo(let id):
            self.reloadScreen(id: id)
        }
    }

    private func loadScreen() {
        loadUseCase
            .execute()
            .map(mapper.transform)
            .catch { error in
                Just(self.mapper.transformError(error))
            }
            .assign(to: \.statePublished, on: self)
            .store(in: &cancellables)
    }

    private func reloadScreen(id: String) {
        reloadUseCase
            .execute(id: id)
            .map(mapper.transform(_:))
            .catch { error in
                Just(self.mapper.transformError(error))
            }
            .assign(to: \.statePublished, on: self)
            .store(in: &cancellables)
    }
}
