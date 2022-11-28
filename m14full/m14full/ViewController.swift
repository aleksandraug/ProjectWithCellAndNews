//
//  ViewController.swift
//  m14full
//
//  Created by Александра Угольнова on 27.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let Button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 500, height: 200))
        button.setTitle("Start", for: .normal)
       // button.backgroundColor = .white
        button.setTitleColor(.white , for: .normal)
        return button
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemMint
        view.addSubview(Button)
        Button.addTarget(self,
                         action: #selector(didTapButton),
                         for: .touchUpInside)
        setupConstraints()
    }
    
    private func setupConstraints() {
        Button.translatesAutoresizingMaskIntoConstraints = false
        Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        Button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
  
    
    @objc func didTapButton(){
        let tabBarVC = UITabBarController()
        
        let vc1 = UINavigationController(rootViewController: FirstViewController())
        vc1.title = "First"
        let vc2 = UINavigationController(rootViewController: SecondViewController())
         vc2.title = "Second"
        let vc3 = UINavigationController(rootViewController: ThirdViewController())
        vc3.title = "Third"
        
        tabBarVC.setViewControllers([vc1, vc2, vc3], animated: false)
        tabBarVC.tabBar.backgroundColor = .systemGray3
        
        guard let items = tabBarVC.tabBar.items else{
            return
        }
        let images = ["1.square.fill", "2.square.fill", "3.square.fill"]
        
        for x in 0..<items.count{
            items[x].image=UIImage(systemName: images[x])
        }
        
        
        tabBarVC.modalPresentationStyle = .fullScreen
        
        present(tabBarVC, animated: true)
    }
 
    


}


