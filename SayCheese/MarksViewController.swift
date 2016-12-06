//
//  WallViewController.swift
//  SayCheese
//
//  Created by vincent on 05/12/2016.
//  Copyright © 2016 kodappy. All rights reserved.
//

import UIKit

class MarksViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    let markCellIdentifier = "MarkTableViewCell"

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellNib = UINib(nibName: markCellIdentifier, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: markCellIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension MarksViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
}

extension MarksViewController: UITableViewDelegate {
    
}

