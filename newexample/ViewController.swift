//
//  ViewController.swift
//  newexample
//
//  Created by Jaleel Gilbert on 2/25/23.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    let viewModel = ViewModel()
    
    private lazy var priceLabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var tableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        size()
        
        
       viewModel.getData { [weak self] result in
           guard let self = self else { return }
           
           if result {
               self.tableView.reloadData()
           }
        }
       
    }
    
    func size() {
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }


}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.coinData.markets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = String(viewModel.coinData.markets[indexPath.row].quoteAsset.rawValue)
        
        return cell
    }
    
}


