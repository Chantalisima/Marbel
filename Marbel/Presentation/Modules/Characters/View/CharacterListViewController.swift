//
//  MainListViewController.swift
//  Marbel
//
//  Created by Chantal de Leste Conde on 25/7/22.
//

import UIKit


extension CharacterListViewController {
   
    struct Model {
        var characters: [Character]
        
        struct Character {
            var id: String
            var name: String
            var description: String
            var thumbnail: String
        }
    }
}

class CharacterListViewController: BaseViewController {
    
    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.backgroundColor = .clear
        table.delegate = self
        table.dataSource = self
    
//        table.register(CharacterViewCell.self, forCellReuseIdentifier: CharacterViewCell.identifier)
        return table
    }()
    
    // MARK: - Properties
    
    private var viewModel: Model
    
    private let presenter: CharacterListPresenterProtocol
    
    // MARK: - Initializers

    init(_ presenter: CharacterListPresenterProtocol) {
        self.presenter = presenter
        self.viewModel = presenter.model
        super.init(nibName: nil, bundle: Bundle.main)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    
    override func loadView() {
        super.loadView()
        
        view.fill(with: tableView)
    }
    
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.viewWillAppear()
    }
    
    // MARK: - Functions


}

extension CharacterListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        // header filter
    }
    
}
