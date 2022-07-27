//
//  MainCoordinator.swift
//  Marbel
//
//  Created by Chantal de Leste Conde on 25/7/22.
//

import UIKit

class MainCoordinator: NSObject, BaseCoordinator {
    
    // MARK: - Properties
    
    let navigationController: UINavigationController
    
    private var appDependencies: AppDependencies
    
    // MARK: - Init
    
    public init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.setNavigationBarHidden(true, animated: false)
        appDependencies = AppDependencies()
        super.init()
    }
    
    func resolve() {
        openSplashView()
    }
    
    private func openSplashView() {
        let vc = appDependencies.makeSplashViewController(signalDelegate: self)
        navigationController.viewControllers = [vc]
//        navigationController.pushViewController(vc, animated: false)
    }
    
    private func openCharacterListView() {
    }
    
    private func openListDetailView() {
        
    }
}

extension MainCoordinator: SplashSignalDelegate {
    func signalTrigged(_ signal: SplashSignal) {
        switch signal {
        case .showCharacterListView:
            openCharacterListView()
        }
    }
}
