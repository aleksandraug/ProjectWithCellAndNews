//
//  DescriptionViewController.swift
//  m14full
//
//  Created by Александра Угольнова on 28.11.2022.
//

import UIKit

class DescriptionViewController: UIViewController{
    
 //   let rod = ThirdViewController()
    
    lazy var descriptionText = " "
    lazy var locationText = " "

  
    
 
    var descText : UILabel = {
        let label =  UILabel()
        label.textColor = Constants.Colors.greenSecondary
        label.font = Constants.Fonts.systemText
        label.numberOfLines = 0
        return label
    }()
    
    var locText : UILabel = {
        let label = UILabel()
        label.textColor = Constants.Colors.greenSecondary
        label.font = Constants.Fonts.systemText
        label.numberOfLines = 0
        return label
    }()
    
    
   
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 16
        stackView.addArrangedSubview(descText)
        stackView.addArrangedSubview(locText)

        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        descText.text = descriptionText
        locText.text = locationText
        setupViews()
        setupConstraints()
    }
    
    private func setupViews(){
        view.addSubview(stackView)
 //       view.addSubview(button)
    }
    
    
    private func setupConstraints(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
   //     view.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
    //    view.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
   //     view.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
   //     view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    
}
