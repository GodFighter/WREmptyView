//
//  ViewController.swift
//  WREmptyView
//
//  Created by GodFighter on 03/26/2020.
//  Copyright (c) 2020 GodFighter. All rights reserved.
//

import UIKit
import WREmptyView

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var items: [String] = []
    var currentCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.reloadData()
        print(tableView.emptyView)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "-", style: .plain, target: self, action: #selector(action_reduce))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(action_add))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

}

fileprivate typealias ViewController_Action = ViewController
extension ViewController_Action {

    @objc func action_reduce() {
        if currentCount > 0 {
            currentCount -= 1
            items.removeLast()
            tableView.reloadData()
        }
    }

    @objc func action_add() {
        currentCount += 1
        items.append("\(currentCount)")
        tableView.reloadData()
    }
}


fileprivate typealias ViewController_TableView = ViewController
extension ViewController_TableView : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .blue
        cell.textLabel?.text = items[indexPath.item]
        return cell
    }
    
    
}

