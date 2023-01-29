//
//  CalculationTypeTableController.swift
//  KFH_Calculator
//
//  Created by asmat manal on 30/01/23.
//

import UIKit

class CalculationTypeTableController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height)
        let cvc = UICollectionView(frame: CGRect(origin: CGPointMake(0, 100), size: CGSize(width: view.frame.width, height: view.frame.height - 100)), collectionViewLayout: layout)
        return cvc
    }()
   
    private let table: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    let calculationTypeArray = ["Marine Equipment","Cars","Constructions Materials","Furniture & Home Appliances","Health & Education Services"]
    let bankingTierArray = ["Sundus","Tamayouz","Ruwad","Nukhba","Rubban"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: view.frame.height - 100)
        contentView.addSubview(collectionView)
        collectionView.backgroundColor = .backgroundGray
        table.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        table.backgroundColor = UIColor.backgroundGray
        collectionView.addSubview(table)
        table.dataSource = self
        table.delegate = self
        setNavigationBarItems(title: "", leftNavigationItem: "Vector (7)", rightNavigationItem: "")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calculationTypeArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let atTT = NSMutableAttributedString(string: calculationTypeArray[indexPath.row], attributes: [NSAttributedString.Key.font: UIFont(name: "Lato-Regular", size: 15), NSAttributedString.Key.foregroundColor : UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)])
        cell.textLabel?.attributedText = atTT
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 43
    }
}








