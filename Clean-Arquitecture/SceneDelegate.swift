//
//  SceneDelegate.swift
//  Clean-Arquitecture
//
//  Created by Juan Andres Vasquez on 24/4/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: scene)
        let rootViewController = SceneFactory.makeRootViewController()
        self.window?.rootViewController = rootViewController
        self.window?.makeKeyAndVisible()
    }
}

final class SceneFactory {
    static func makeRootViewController() -> UIViewController {

        let localStorage = MemoryStorageImpl()
        let optionsMapper = OptionsMapperImpl()
        let localDataSource = ExampleLocalStorageDataSourceImpl(localStorage: localStorage)
        let remoteDataSource = ExampleRemoteDataSourceImpl()
        let repository = OptionsRepositoryImpl(
            remoteDataSource: remoteDataSource,
            localDataSource: localDataSource,
            mapper: optionsMapper
        )
        let loadUseCase = ExampleUseCaseImpl(repository: repository)
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
