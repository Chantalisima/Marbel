//
//  SearchHeaderView.swift
//  Marvel
//
//  Created by Chantal de Leste Conde on 5/8/22.
//

import Foundation
import UIKit

public typealias Action = () -> Void

protocol SearchHeaderViewDelegate {
    func searchWordPressed(text: String)
}

class SearchHeaderView: UIView {
    
    // MARK: - MODEL

    
    // MARK: - PROPERTIES
    
    var delegate: SearchHeaderViewDelegate?
    
    
    // MARK: - VIEWS
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search a character"
        return searchBar
    }()
    
    lazy var searchBTN: UIButton = {
        let btn = UIButton(frame: CGRect(x: 0 , y: 0, width: 60, height: 0))
        
        btn.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        btn.widthAnchor.constraint(equalToConstant: 60).isActive = true
        btn.setTitle("Search", for: .normal)
        btn.titleLabel?.textColor = .green
        btn.titleLabel?.font = .boldSystemFont(ofSize: 14)
        return btn
    }()
    
    lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [searchBar, searchBTN])
        stack.axis = .horizontal
        stack.spacing = 12
        return stack
    }()
    
    // MARK: - INIT
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        fill(with: stack, edges: UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12), atSafeArea: false)
    }
    
    // MARK: FUNCTIONS
    

    @objc
    func buttonTap(sender: UIButton) {
        delegate?.searchWordPressed(text: self.searchBar.text ?? "")
    }
}
