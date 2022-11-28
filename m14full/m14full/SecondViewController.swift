//
//  SecondViewController.swift
//  m14full
//
//  Created by Александра Угольнова on 27.11.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    let cellIdentifier = "CellIdentifier"
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        //tableView.rowHeight = 100
        return tableView
    }()
    
    struct NewsRecordModel {
        let title: String
        let publishedAt: String
    }

    let models: [NewsRecordModel] = [
        NewsRecordModel(
            title: "Airbus Ventures invests in Tokyo-based ispace",
            publishedAt: "2021-10-25T11:23:09.000Z"
        ),
        NewsRecordModel(
            title: "SpaceX fires up first upgraded Starship engine",
            publishedAt: "2021-10-25T09:13:32.000Z"
        ),
        NewsRecordModel(
            title: "IAI announces new small GEO satellite bus",
            publishedAt: "2021-10-25T08:33:11.000Z"
        ),
        NewsRecordModel(
            title: "Here’s how SpaceX is (probably) going to refuel Starships in space",
            publishedAt: "2021-10-24T19:53:33.000Z"
        ),
        NewsRecordModel(
            title: "Chang Zheng 3B lifts Shijian 21 to orbit",
            publishedAt: "2021-10-24T18:26:25.000Z"
        ),
        NewsRecordModel(
            title: "BepiColombo completes first Mercury flyby, science provides insight into planet’s unique environment",
            publishedAt: "2021-10-24T17:22:02.000Z"
        ),
        NewsRecordModel(
            title: "China launches classified space debris mitigation technology satellite",
            publishedAt: "2021-10-24T10:23:11.000Z"
        ),
        NewsRecordModel(
            title: "Arianespace breaks payload mass record on final Ariane 5 launch before Webb",
            publishedAt: "2021-10-24T08:13:08.000Z"
        ),
        NewsRecordModel(
            title: "Conference seeks to build interest in space among elected officials",
            publishedAt: "2021-10-24T02:23:10.000Z"
        ),
        NewsRecordModel(
            title: "Ariane 5 launches civilian, military satellites; mission to clear way for James Webb launch",
            publishedAt: "2021-10-23T21:10:54.000Z"
        ),
        NewsRecordModel(
            title: "Under watchful eye of NASA, teams prep for final Ariane 5 flight before Webb",
            publishedAt: "2021-10-23T19:13:07.000Z"
        ),
        NewsRecordModel(
            title: "NASA sets Artemis 1 launch for no earlier than February",
            publishedAt: "2021-10-23T03:33:12.000Z"
        ),
        NewsRecordModel(
            title: "L3 Harris wins $120 million contract to upgrade Space Force electronic jammers",
            publishedAt: "2021-10-22T23:13:11.000Z"
        ),
        NewsRecordModel(
            title: "NASA targets February launch for Artemis 1 moon mission",
            publishedAt: "2021-10-22T20:33:07.000Z"
        ),
        NewsRecordModel(
            title: "NASA Commits $28 Million to Underfunded US Jurisdictions",
            publishedAt: "2021-10-22T20:23:00.000Z"
        ),
        NewsRecordModel(
            title: "Ship 20 completes milestone RVac Static Fire – Musk cites ambitious path to launch",
            publishedAt: "2021-10-22T20:09:14.000Z"
        ),
        NewsRecordModel(
            title: "China’s hypersonic vehicle test a ‘significant demonstration’ of space technology",
            publishedAt: "2021-10-22T19:23:10.000Z"
        ),
        NewsRecordModel(
            title: "Space Adventures no longer planning Crew Dragon flight",
            publishedAt: "2021-10-22T19:23:10.000Z"
        ),
        NewsRecordModel(
            title: "NASA Invites Media to Launch of IXPE Mission to Study X-rays in Space",
            publishedAt: "2021-10-22T18:33:00.000Z"
        ),
        NewsRecordModel(
            title: "Ariane 5 launch delayed for more ground systems checks",
            publishedAt: "2021-10-22T16:43:06.000Z"
        )
    ]

    struct publishedDateModel {
        let title: String
        let publishedAt: Date
    }
    
    

    func stringToDate() -> [publishedDateModel] {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let publisheDate: [publishedDateModel] = models.map{publishedDateModel.init(title: $0.title, publishedAt: formatter.date(from: $0.publishedAt)!)}
        return publisheDate
    }

//    let publishedDateArray:[publishedDateModel] = stringToDate()

    func createDictionary() -> [Date: [publishedDateModel]]{
        let publisheddateArray = stringToDate()
        let dictionary = Dictionary(grouping: publisheddateArray, by: {(el:publishedDateModel) -> Date in
            let components = Calendar.current.dateComponents([.day, .month, .year], from: el.publishedAt)
            let date = Calendar.current.date(from: components)
            return date ?? Date()
        })
        return dictionary
    }

    struct SectionNewsModel {
        let finalTitle: Date
        let finalCell: [publishedDateModel]
    }

    var sectionViewModel = [SectionNewsModel]()


    func dictToArr() -> [SectionNewsModel] {
        let newDict: [Date: [publishedDateModel]] = createDictionary()
        let section: [SectionNewsModel] = newDict.map{(key, values) in return SectionNewsModel(finalTitle: key, finalCell: values)}
        return section
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sectionViewModel = dictToArr()
        self.sectionViewModel.sort(by: {$0.finalTitle < $1.finalTitle})
        tableView.register(UITableViewCell.self , forCellReuseIdentifier: cellIdentifier)
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

extension SecondViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sectionViewModel.count
    }
    
    
    func numberOfRowsInSection(in tableView: UITableView) -> Int {
        return self.sectionViewModel.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = self.sectionViewModel[section]
        let data = section.finalTitle
        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = "dd MMMM yyyy"
        return dataFormatter.string(from: data)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = self.sectionViewModel[section]
        return section.finalCell.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let section = sectionViewModel[indexPath.section]
        let textCell = section.finalCell[indexPath.row]
        
        func dateToString() -> String {
            let data = textCell.publishedAt
            let formatter = DateFormatter()
            formatter.dateFormat = "dd MMMM yyyy"
            let dateToStr = formatter.string(from: data)
            
            return dateToStr
        }
        
        let strPublieshed2 = dateToString()
        let str2 = " : "
        let str = strPublieshed2 + str2 + textCell.title
        cell.textLabel?.text = str
 //       cell.detailTextLabel?.text = strPublieshed2
        
        cell.textLabel?.numberOfLines = 0
        
        return cell
    }
}
    
  

extension SecondViewController: UITableViewDelegate{}


