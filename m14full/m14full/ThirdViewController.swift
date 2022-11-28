//
//  ThirdViewController.swift
//  m14full
//
//  Created by Александра Угольнова on 27.11.2022.
//

import UIKit


class ThirdViewController: UIViewController {
    
    let cellIdentifierThree = "CellIdentifierThree"
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        //tableView.rowHeight = 100
        return tableView
    }()
    
    
    struct NewsWithLocationModel {
        let name: String
        let description: String
        let location: String
    }

    let models: [NewsWithLocationModel] = [
        NewsWithLocationModel(
            name: "2017 NASA Astronaut class graduation ceremony",
            description: "NASA will honor the first class of astronaut candidates to graduate under the Artemis program at 10:30 a.m. EST Friday, Jan. 10, at the agency’s Johnson Space Center in Houston. After completing more than two years of basic training, these candidates will become eligible for spaceflight, including assignments to the International Space Station, Artemis missions to the Moon, and ultimately, missions to Mars.",
            location: "NASA's Johnson Space Center, Houston, TX, USA"
        ),
        NewsWithLocationModel(
            name: "70th International Astronautical Congress",
            description: "The International Astronautical Congress is a yearly conference where key figures in the space industry meet and showcase/discuss events in the spaceflight industry.\r\n\r\nThe event lasts starts on 21st October and lasts a week. Some of the panels will be live streamed for free on NASA TV.",
            location: "Washington D.C, United States"
          ),
        NewsWithLocationModel(
            name: "8th meeting of the National Space Council",
            description: "US Vice President Mike Pence will convene the 8th meeting of the National Space Council at NASA's Kennedy Space Center on December 9 at 12:30 p.m. ET. \r\n\r\nThe meeting will be livestreamed on NASA TV.",
            location: "Kennedy Space Center"
        ),
        NewsWithLocationModel(
            name: "Apollo 11th 50th Anniversary - Lunar Landing",
            description: "The United States' Apollo 11 was the first crewed mission to land on the Moon, on 20 July 1969. To date, the United States is the only country to have successfully conducted crewed missions to the Moon, with the last departing the lunar surface in December 1972.\r\n\r\nA total of twelve men have landed on the Moon. This was accomplished with two US pilot-astronauts flying a Lunar Module on each of six NASA missions across a 41-month period starting 20 July 1969 UTC, with Neil Armstrong and Buzz Aldrin on Apollo 11, and ending on 14 December 1972 UTC with Gene Cernan and Jack Schmitt on Apollo 17. Cernan was the last to step off the lunar surface.",
            location: "Lunar Surface"
        ),
        NewsWithLocationModel(
            name: "Apollo 12: 50th Anniversary Coverage",
            description: "Apollo 12 50th anniversary has a commemorative stream for the launch beginning at 11am EST. \r\n\r\nThe launch will take place at 11:42am.\r\n\r\n\"The second Apollo crew built on the work of the first. In addition to continuing Apollo's lunar exploration tasks they deployed the Apollo Lunar Surface Experiments Package, a set of investigations left on the Moon's surface to gather data. On their way to the Moon, the Apollo 12 crew conducted an orbital maneuver that let them land in the Moon's Western Hemisphere, so they could recover portions of a lander that had been on the moon for two years.\" - NASA",
            location: "NASA TV"
        ),
        NewsWithLocationModel(
            name: "Arianespace VV17 failure press conference",
            description: "8 minutes after liftoff of Vega mission VV17, following the first ignition of the engine of the Avum upper stage, a deviation of trajectory was identified, entailing the loss of the mission. There will be a press conference Tuesday, November 17th, 2020 at 10:00 am Kourou time / 2:00 pm Paris time.",
            location: "Guyana Space Center, Kourou, French Guiana"
        ),
        NewsWithLocationModel(
            name: "BepiColombo Earth Flyby",
            description: "The ESA-JAXA BepiColombo mission made a close approach of Earth on April 10, 2020 at 04:25 UTC. Gravity assist flybys are needed to set the spacecraft on course for Mercury orbit.",
            location: "Earth"
        )
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self , forCellReuseIdentifier: cellIdentifierThree)
        tableView.dataSource = self
        tableView.delegate = self
        //tableView.rowHeight = 100
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

    
}

extension ThirdViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifierThree, for: indexPath)
        let viewModel = models[indexPath.row]
        cell.textLabel?.text = viewModel.name
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
}

extension ThirdViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = models[indexPath.row]
        let descriptionViewController = DescriptionViewController()
        descriptionViewController.title = viewModel.name
        descriptionViewController.descriptionText  = viewModel.description
        descriptionViewController.locationText  = viewModel.location
     
        navigationController?.pushViewController(descriptionViewController, animated: true)
       
    
        
     
       // descriptionViewController.
        
    }
}
