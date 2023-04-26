//
//  ExampleSyncronizerImpl.swift
//  Clean-Arquitecture
//
//  Created by Juan Andres Vasquez on 25/4/23.
//

import Foundation
import Combine

final class ExampleSyncronizerImpl: ExampleSyncronizer {
    
    private let legacyContainer: LegacyContainer
    private let exampleDataSource: ExampleLocalDataSource
    private var cancellables = Set<AnyCancellable>()
    let stateStore: ExampleStateStore

    init(stateStore: ExampleStateStore,
         legacyContainer: LegacyContainer,
         exampleDataSource: ExampleLocalDataSource) {
        self.stateStore = stateStore
        self.legacyContainer = legacyContainer
        self.exampleDataSource = exampleDataSource
    }

    func activeSnyc() {
        stateStore
            .statePublisher
            .dropFirst()
            .sink { [weak self] state in
                guard let self = self else { return }
                print("DomainState is Changed")
                self.syncState(state)
            }
            .store(in: &cancellables)
    }

    func desactiveSync() {
        cancellables.forEach { $0.cancel() }
    }
}

// MARK: - Implement smell sync code
extension ExampleSyncronizerImpl {
    func syncState(_ state: ExampleDomainState) {
        print("------ Start sync with legacy world ------")
        syncLegacyDataIfNeeded()

        if state.selectedOptions.isEmpty {
            legacyContainer.clearSomeParams()
        }

        switch state.mode {
        case .store:
            legacyContainer.resetSomeValues()
            legacyContainer.clearSomeParams()
        case .pay:
            legacyContainer.resetSomeValues()
        case .repay:
            // Nothing for now
            break
        }
        print("------ End sync with legacy world ------")
    }

    func syncLegacyDataIfNeeded() {
        exampleDataSource
            .getLegacyOption()
            .sink { _ in
                // Nothing yet
            } receiveValue: { [weak self] data in
                guard let self = self else { return }
                print("Set legacy models in Legacy World")
                self.legacyContainer.saveSelectedOptions(options: data)
            }
            .store(in: &cancellables)
    }
}
