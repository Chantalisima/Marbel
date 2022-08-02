//  
//  CharacterDetailViewControllerPresenter.swift
//  Marvel
//
//  Created by Chantal de Leste Conde on 2/8/22.
//
//  iOS Templates by Alberto Luque Fernández
//

import UIKit

class CharacterDetailPresenter: BasePresenter, CharacterDetailViewControllerPresenterProtocol {
    
    // MARK: - Properties
    
    private weak var navigationDelegate: CharacterDetailViewControllerNavigationDelegate?
    
    weak var ui: CharacterDetailViewControllerViewDelegate?
    
    var model: CharacterDetailViewControllerViewController.Model
    
    // MARK: - Initialization
    
    init(navigationDelegate: CharacterDetailViewControllerNavigationDelegate) {
        self.navigationDelegate = navigationDelegate
    }
    
    // MARK: - CharacterDetailViewControllerPresenter Functions
    
}
