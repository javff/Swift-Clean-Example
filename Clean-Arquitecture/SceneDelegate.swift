//
//  SceneDelegate.swift
//  Clean-Arquitecture
//
//  Created by Juan Andres Vasquez on 24/4/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var sincronizer: ExampleSyncronizer!
    let localStorage = MemoryStorageImpl()
    let legacyImpl = LegacyImpl()
    let stateStore: ExampleStateStore = {
        let state = ExampleDomainState(currentId: 1, mode: .pay, selectedOptions: [])
        let stateStore = ExampleStateStoreImpl(state: state)
        return stateStore
    }()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: scene)
        setupSyncronizer()
        let rootViewController = SceneFactory.makeRootViewController(
            localStorage: localStorage,
            stateStore: stateStore
        )
        self.window?.rootViewController = rootViewController
        self.window?.makeKeyAndVisible()
    }

    private func setupSyncronizer() {

        let localDataSource = ExampleLocalDataSourceImpl(localStorage: localStorage)

        sincronizer = ExampleSyncronizerImpl(
            stateStore: stateStore,
            legacyContainer: legacyImpl,
            exampleDataSource: localDataSource
        )
        sincronizer.activeSnyc()
    }
}

final class SceneFactory {
    static func makeRootViewController(localStorage: MemoryStorage, stateStore: ExampleStateStore) -> UIViewController {

        let optionsMapper = OptionsMapperImpl()
        let remoteDataSource = ExampleRemoteDataSourceImpl()
        let localDataSource = ExampleLocalStorageDataSourceImpl(localStorage: localStorage)
        let repository = OptionsRepositoryImpl(
            remoteDataSource: remoteDataSource,
            localDataSource: localDataSource,
            mapper: optionsMapper
        )
        let loadUseCase = ExampleUseCaseImpl(repository: repository, stateStore: stateStore)
        let reloadUseCase = ReloadUseCaseImpl()
        let mapper = ExampleMapperImpl()
        let reducer = ExampleActionReducerImpl()
        let viewModel = ExampleViewModelImpl(
            reducer: reducer,
            mapper: mapper,
            loadUseCase: loadUseCase,
            reloadUseCase: reloadUseCase
        )
        let controller = ExampleViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: controller)
        return navigationController
    }
}
