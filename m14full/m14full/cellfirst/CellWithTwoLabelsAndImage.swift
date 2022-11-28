//
//  CellWithTwoLabelsAndImage.swift
//  m14full
//
//  Created by Александра Угольнова on 27.11.2022.
//

import UIKit

class CellWithTwoLabelsAndImage : UITableViewCell {
    
    private lazy var labelText : UILabel = {
        let label = UILabel()
        label.textColor = Constants.Colors.greenSecondary
        label.font = Constants.Fonts.systemText
        return label
    }()
    
    private lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 16
        stackView.addArrangedSubview(image)
        stackView.addArrangedSubview(labelText)

        return stackView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        
        setupConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        image.image = nil
    }
    
    func configure(_ viewModel: CellWithTwoLabelsAndImageViewModel){
        labelText.text = viewModel.text
        image.image = viewModel.image
    }

    private func setupConstraints(){
       
       // stackView.leftAnchor.constraint(equalTo:  stackView.leftAnchor, constant: 20).isActive = true
        //stackView.rightAnchor.constraint(equalTo:  stackView.rightAnchor, constant: 20).isActive = true
       // stackView.topAnchor.constraint(equalTo:  stackView.topAnchor, constant: 10).isActive = true
       // stackView.bottomAnchor.constraint(equalTo:  stackView.bottomAnchor, constant: 10).isActive = true
        stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 250).isActive = true
    }
    
}

