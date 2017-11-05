//
//  SearchItemViewController.swift
//  Wishlist2
//
//  Created by Pushkar Khedekar on 10/30/17.
//  Copyright © 2017 Pushkar Khedekar. All rights reserved.
//

import UIKit

class SearchItemViewController: UIViewController {
    
    @IBOutlet weak var searchItem: UITextField!
    
    @IBOutlet weak var searchItemTextView: UITextView!
  
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }

    func dismissKeyboard() {
        view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "closeSearch", sender: self)
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        if searchItem.text == nil {
            createAlert("Empty field", "Enter item name to search.")
        } else {
            viewAllItems(Cart.cart.searchItem((searchItem.text)!)!)
            searchItem.text = ""
        }
    }
    
    func createAlert(_ title : String,_ message : String){
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { action in }
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true) {}
    }
    
    
    func viewAllItems(_ itemList : [Item]){
        
        if itemList.count != 0 || itemList == nil{
            for item in itemList {
                
                searchItemTextView.translatesAutoresizingMaskIntoConstraints = false
                searchItemTextView.text = "\(item.itemName)    \(item.itemPrice) "
                searchItemTextView.font = searchItemTextView.font?.withSize(20)
                searchItemTextView.textColor = UIColor(red: 0/255, green: 0/255, blue: 50/255, alpha:1.0)
                
            }
        } else {
            
            searchItemTextView.translatesAutoresizingMaskIntoConstraints = false
            searchItemTextView.text = "No Item found "
            searchItemTextView.font = searchItemTextView.font?.withSize(20)
            searchItemTextView.textColor = UIColor(red: 0/255, green: 0/255, blue: 50/255, alpha:1.0)
            
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
