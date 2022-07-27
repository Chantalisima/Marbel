//
//  AppDependencies.swift
//  Marvel
//
//  Created by Chantal de Leste Conde on 25/7/22.
//

import Foundation
import UIKit

class AppDependencies {
    
//    private init() {}

    func makeSplashViewController(signalDelegate: SplashSignalDelegate) -> SplashViewController {
        let interactor = SplashInteractor(apiSplashDataSource: ApiSplashDataSource.shared, sessionCharactersDataSource: SessionCharactersDataSource.shared)
        let presenter = SplashPresenter(signalDelegate: signalDelegate, splashInteractor: interactor)
        let vc = SplashViewController(presenter)
        return vc
    }
}
