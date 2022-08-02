//  
//  CharacterDetailViewControllerPresenterProtocol.swift
//  Marvel
//
//  Created by Chantal de Leste Conde on 2/8/22.
//
//  iOS Templates by Alberto Luque Fernández
//

import UIKit

enum CharacterDetailNavigation {
    
}

protocol CharacterDetailNavigationDelegate: AnyObject {
    func handle(_ navigation: CharacterDetailNavigation)
}

protocol CharacterDetailPresenterProtocol where Self: BasePresenter {
    
    var model: CharacterDetailViewController.Model { get set }
    
}
