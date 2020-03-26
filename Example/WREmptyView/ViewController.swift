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

    override func viewDidLoad() {
        super.viewDidLoad()

        let tableView = UITableView()
        tableView.reloadData()
        print(tableView.emptyView)        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

