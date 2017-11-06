//
//  DisplayListViewController.swift
//  WishListApp
//
//  Created by Pushkar Khedekar on 11/5/17.
//  Copyright © 2017 Pushkar Khedekar. All rights reserved.
//

import UIKit

class DisplayListViewController: UITableViewController, UISearchBarDelegate {
    
    var myList = Cart.cart.sessionCart
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBAction func addButtonPressed(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let aic = storyboard.instantiateViewController(withIdentifier: "AddItemController") as! AddItemController
        self.navigationController?.pushViewController(aic, animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBarPrepare()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        myList = Cart.cart.sessionCart
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
        return 1
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
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

   /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let cell = tableView.cellForRow(at: indexPath) as! CellView
            let item = cell.nameLabel.text
            Cart.cart.removeItem(item!)
            myList = Cart.cart.sessionCart
            self.tableView.reloadData()
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteItem = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            let cell = tableView.cellForRow(at: indexPath) as! CellView
            let item = cell.nameLabel.text
            Cart.cart.removeItem(item!)
            self.myList = Cart.cart.sessionCart
            self.tableView.reloadData()

        }
        
        let viewItem = UITableViewRowAction(style: .normal, title: "View") { (action, indexPath) in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let idl = storyboard.instantiateViewController(withIdentifier: "ItemDetailViewController") as! ItemDetailViewController
             let cell = tableView.cellForRow(at: indexPath) as! CellView
             let name = cell.nameLabel.text
             let item = Cart.cart.retrieveItem(name!)
             idl.item = item
            self.navigationController?.pushViewController(idl, animated: true)
        }
        
        viewItem.backgroundColor = UIColor.blue
        
        return [deleteItem, viewItem]
    }
    
}
