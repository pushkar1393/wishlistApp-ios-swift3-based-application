//
//  ItemDetailViewController.swift
//  WishListApp
//
//  Created by Pushkar Khedekar on 11/5/17.
//  Copyright © 2017 Pushkar Khedekar. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController {
    
    var item : Item? = nil
    
    @IBOutlet weak var imageContainer: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemDescriptionLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var itemStoreNameLabel: UILabel!
    @IBOutlet weak var itemStoreContactLabel: UILabel!
    @IBOutlet weak var itemStoreAddressLabel: UILabel!
    @IBOutlet weak var itemCategoryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         imageContainer.image = item?.itemImage
        
         itemNameLabel.text = "Name :" + (item?.itemName)!

        itemDescriptionLabel.text = "Description :" + (item?.itemDescription)!

        itemPriceLabel.text = "Price :" + (String((item?.itemPrice)!))

        itemStoreNameLabel.text = "Store Name :" + (item?.store.storeName)!

        itemStoreAddressLabel.text = "Store Address :" + (item?.store.storeAddress)!
        
        itemStoreContactLabel.text = "Store Contact :" + (String((item?.store.storeContact)!))
        
        itemCategoryLabel.text = "Item Category :" + (item?.category)!
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
