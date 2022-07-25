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
        appDependencies = AppDependencies()
    }
    
    func resolve() {
        openSplashView()
    }
    
    private func openSplashView() {
        
    }
    
    private func openMainListView() {
        
    }
    
    private func openListDetailView() {
        
    }
}
