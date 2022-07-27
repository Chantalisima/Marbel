//
//  SplashPresenter.swift
//  Marvel
//
//  Created by Chantal de Leste Conde on 25/7/22.
//

import UIKit

class SplashPresenter: BasePresenter, SplashPresenterProtocol {
    
    // MARK: - Properties
    
    private weak var signalDelegate: SplashSignalDelegate?
    
    var model = SplashViewController.Model()
    
    private let splashInteractor: SplashInteractorProtocol

    // MARK: - Initialization
    
    public init(signalDelegate: SplashSignalDelegate, splashInteractor: SplashInteractorProtocol) {
       self.signalDelegate = signalDelegate
       self.splashInteractor = splashInteractor
    }
    
    // MARK: - SplashPresenter Functions
    
    public override func viewDidAppear() {
        Task.init {
            do {
                let characters = try await self.splashInteractor.getCharacters()
                print("Characters received \(characters)")
                self.signalDelegate?.signalTrigged(.showCharacterListView)
            } catch(let error) {
                print("error get to splash presenter layer:\(error.localizedDescription)")
            }

        }
    }
}
