//
//  CharacterListPresenterProtocol.swift
//  Marbel
//
//  Created by Chantal de Leste Conde on 25/7/22.
//

import Foundation

enum CharacterListNavigation {
    case detail(String)
}

protocol CharacterListNavigationDelegate: AnyObject {
    func handle(_ navigation: CharacterListNavigation)
}


protocol CharacterListPresenterProtocol where Self: BasePresenter {
    
    var model: CharacterListViewController.Model { get set }
    
    func showDetail(id: String)
}
