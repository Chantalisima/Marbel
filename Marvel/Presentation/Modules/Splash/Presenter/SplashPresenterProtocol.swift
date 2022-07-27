//
//  SplashPresenterProtocol.swift
//  Marvel
//
//  Created by Chantal de Leste Conde on 25/7/22.
//

import UIKit

// MARK: - ViewState

enum SplashSignal {
    case showCharacterListView
}

protocol SplashSignalDelegate: class {
    func signalTrigged(_ signal: SplashSignal)
}

protocol SplashPresenterProtocol where Self: BasePresenter {
        
    var model: SplashViewController.Model { get set }
    
}

