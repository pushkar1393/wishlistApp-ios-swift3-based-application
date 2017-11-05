//
//  ItemsViewController.swift
//  Wishlist2
//
//  Created by Pushkar Khedekar on 10/30/17.
//  Copyright © 2017 Pushkar Khedekar. All rights reserved.
//

import UIKit

class ItemsViewController: UIViewController {
    
    @IBOutlet weak var itemTextView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        viewAllItems()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "closeView", sender: self)
    }

    func viewAllItems(){
        
        itemTextView.translatesAutoresizingMaskIntoConstraints = false
        itemTextView.font = itemTextView.font?.withSize(20)
        var fieldText: String = ""
        for item in Cart.cart.listAllItems() {
            fieldText.append( " Item: \(item.itemName) | Price: \(item.itemPrice) \n Category: \(item.category) | Store: \(item.store.storeName)\n\n")
        }
        itemTextView.text = fieldText
        
        
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
