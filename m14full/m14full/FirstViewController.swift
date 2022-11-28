//
//  FirstViewController.swift
//  m14full
//
//  Created by Александра Угольнова on 27.11.2022.
//

import UIKit


class FirstViewController: UIViewController {
   
 
    let cellWithTwoLabelsAndImage = "cellWithTwoLabelsAndImage"
    

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    

    var dataWithImages: [CellWithTwoLabelsAndImageViewModel] = [
        CellWithTwoLabelsAndImageViewModel(
         text: "Austria",
         image: Constants.Image.austria ?? UIImage()
        ),
        CellWithTwoLabelsAndImageViewModel(
         text: "Germany",
         image: Constants.Image.germany ?? UIImage()
        ),
        CellWithTwoLabelsAndImageViewModel(
         text: "Greece",
         image: Constants.Image.greece ?? UIImage()
        ),
        CellWithTwoLabelsAndImageViewModel(
         text: "Belgium",
         image: Constants.Image.belgium ?? UIImage()
        ),
        CellWithTwoLabelsAndImageViewModel(
         text: "France",
         image: Constants.Image.france ?? UIImage()
        )
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.register(CellWithTwoLabelsAndImage.self , forCellReuseIdentifier: cellWithTwoLabelsAndImage)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 100
        setupViews()
        setupConstraints()
    }
    
    private func setupViews(){
        view.addSubview(tableView)
 //       view.addSubview(button)
    }
    
    private func setupConstraints(){
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
extension FirstViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataWithImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellWithTwoLabelsAndImage) as? CellWithTwoLabelsAndImage
        let viewModel = dataWithImages[indexPath.row]
        cell?.configure(viewModel)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle:
                   UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted")
            self.dataWithImages.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath,
                   to destinationIndexPath: IndexPath) {
        let movedObject = self.dataWithImages[sourceIndexPath.row]
        dataWithImages.remove(at: sourceIndexPath.row)
        dataWithImages.insert(movedObject, at: destinationIndexPath.row)
    }
}

extension FirstViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = dataWithImages[indexPath.row]
        
        let alertController = UIAlertController(
            title: "\(viewModel.text)",
            message: "Not found",
            preferredStyle: .alert
        )
        let dismissAction = UIAlertAction(
            title: "Ok",
            style: .default,
            handler: {action in
                tableView.deselectRow(at: indexPath, animated: true)
                
            })
        
        alertController.addAction(dismissAction)
        present(alertController, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, orRowAt indexPath: IndexPath) -> String? {
        "Delete"
    }
}

