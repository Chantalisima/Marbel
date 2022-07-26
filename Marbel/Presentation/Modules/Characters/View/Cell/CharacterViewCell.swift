//
//  CharacterViewCell.swift
//  Marbel
//
//  Created by Chantal de Leste Conde on 25/7/22.
//

import UIKit

class CharacterViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

class CharacterView: UIView {
    
    // MARK: - Model
    
    struct Model {
        
        var name: String
        var description: String
        var image: String
        
        static let example: Model = .init(name: "Hulk", description: "aoinvoqenrgonrg", image: "")
    }
    
    
    // MARK: - VIEWS
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 8)
        label.textColor = .gray
        label.numberOfLines = 0
        return label
    }()
    
    lazy var characterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "ico-pdf-big")
        imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return imageView
    }()
    
    lazy var stackView: UIStackView = {
        let rightStackView = UIStackView(arrangedSubviews: [
            nameLabel,
            descriptionLabel
        ])
        rightStackView.axis = .vertical
        rightStackView.spacing = 8
        
        let leftStackView = UIStackView(arrangedSubviews: [
            characterImage
        ])
        
        leftStackView.alignment = .center
        
        let stackView = UIStackView(arrangedSubviews: [
            leftStackView,
            rightStackView
        ])
        stackView.spacing = 16
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true

        return view
    }()
    
    private lazy var horizontalView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            HorizontalSpacerView(space: 12),
            separatorView,
            HorizontalSpacerView(space: 12)
            ])
        stackView.axis = .horizontal
        stackView.layer.backgroundColor = UIColor.white.cgColor
        return stackView
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.layer.backgroundColor = UIColor.white.cgColor
        view.fill(with: stackView, edges: .init(top: 12, left: 18, bottom: 12, right: 18))
        return view
    }()
    
    lazy var mainView: UIStackView = {
        
        let stackView = UIStackView(arrangedSubviews: [
            horizontalView,
            containerView
        ])
        stackView.axis = .vertical
        
        return stackView
    }()
    
    // MARK: - Properties
    
    var model: Model = .example
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Views
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func setupView() {
        fill(with: mainView, edges: .init(top: 0, left: 16, bottom: 0, right: 16))
    }
    
    func set(viewModel: Model) {
        self.model = viewModel
    }
}
