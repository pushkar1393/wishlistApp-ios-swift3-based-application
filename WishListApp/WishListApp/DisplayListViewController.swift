//
//  DisplayListViewController.swift
//  WishListApp
//
//  Created by Pushkar Khedekar on 11/12/17.
//  Copyright © 2017 Pushkar Khedekar. All rights reserved.
//

import UIKit

class DisplayListViewController: UITableViewController, UISearchBarDelegate {
    
    var myList = Cart.cart.sessionCart
    var item : Item?
    
    @IBAction func addButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "addItems", sender: self)
    }

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBarPrepare()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        myList = Cart.cart.sessionCart
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    func searchBarPrepare()
    {
        searchBar.showsScopeBar = true
        searchBar.delegate = self as! UISearchBarDelegate
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        myList = Cart.cart.sessionCart
        if searchText.isEmpty{
            self.tableView.reloadData()
        }
        else
        {   let name = searchText.lowercased()
            myList = myList.filter({ (sr) -> Bool in return sr.itemName.contains(name)})
            self.tableView.reloadData()
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1;
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myList.count
    }

    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! CellView
        let item = myList[indexPath.row]
        cell.nameLabel.text = item.itemName
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteItem = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            let cell = tableView.cellForRow(at: indexPath) as! CellView
            let item = cell.nameLabel.text
            Cart.cart.removeItem(item!)
            self.myList = Cart.cart.sessionCart
            self.tableView.reloadData()
            
        }
        
        let viewItem = UITableViewRowAction(style: .normal, title: "View") { (action, indexPath) in
            let cell = tableView.cellForRow(at: indexPath) as! CellView
            let name = cell.nameLabel.text
            self.item = Cart.cart.retrieveItem(name!)
            self.performSegue(withIdentifier: "viewItem", sender: self)
        }
        
        
        viewItem.backgroundColor = UIColor.blue
        return [deleteItem, viewItem]
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewItem = segue.destination as? ItemDetailViewController {
            viewItem.item = item
        }
    }
    
    

   
}
