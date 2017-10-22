//
//  Cart.swift
//  WishListApp
//
//  Created by Pushkar Khedekar on 10/22/17.
//  Copyright © 2017 Pushkar Khedekar. All rights reserved.
//

import Foundation

class Cart {
    
    static let cart = Cart()
    
    var sessionCart = [Item]()
    
    
    func addItem(_ itemToBeInserted : Item ) {
        
        sessionCart.append(itemToBeInserted)
    }
    
    
    func removeItem(_ itemNameToBeRemoved : String) {
        var count = 0
        for item in sessionCart{
            if item.itemName == itemNameToBeRemoved {
                sessionCart.remove(at: count)
                print("Item \(item.itemName) is removed from your cart !")
                break
            }
            count += 1
        }
        if count == sessionCart.count{
            print("Cannot find the Item you specified. Try again !")
        }
    }
    
    
    func searchItem(_ itemToBeSearched : String) -> [Item]? {
        var listOfItems = [Item]()
        for item in sessionCart {
            if itemToBeSearched == item.itemName{
                listOfItems.append(item)
            }
        }
        if listOfItems.isEmpty{
            return nil
        }
        return listOfItems
    }
    
    
    func listAllItems() {
        for product in sessionCart {
            print("\(product.itemName)   \(product.itemPrice)   \(product.category)    \(product.store.storeName)")
        }
    }
    


}
