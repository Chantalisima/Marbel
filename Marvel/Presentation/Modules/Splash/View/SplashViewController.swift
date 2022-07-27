//
//  SplashViewController.swift
//  Marvel
//
//  Created by Chantal de Leste Conde on 25/7/22.
//

import UIKit

// MARK: - Model

extension SplashViewController {
    
    struct Model {
        // Declare here ViewModel properties
    }
    
}

class SplashViewController: BaseViewController {

    // MARK: - Views
    
    lazy var icon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        
        imageView.widthAnchor.constraint(equalToConstant: 290).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 290).isActive = true
        
        return imageView
    }()
    
    
    // MARK: - Properties
    
    private var model: Model
    
    private var presenter: SplashPresenterProtocol
    
    // MARK: - Initializers
    
    public init(_ presenter: SplashPresenterProtocol) {
        self.presenter = presenter
        self.model = presenter.model
        super.init(nibName: nil, bundle: Bundle.main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("This init has not been implemented. Use init(:Presenter) instead.")
    }

    // MARK: - Setup UI
    
    override public func loadView() {
        super.loadView()

        view.backgroundColor = .white
        view.addSubview(icon)
        NSLayoutConstraint.activate([
            icon.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            icon.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
    // MARK: - Life cycle
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.viewDidAppear()
    }
    
    // MARK: - Functions

}
