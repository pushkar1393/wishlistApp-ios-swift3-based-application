//
//  Cart.swift
//  Wishlist2
//
//  Created by Pushkar Khedekar on 10/30/17.
//  Copyright © 2017 Pushkar Khedekar. All rights reserved.
//

import Foundation

class Cart {
    
    static let cart = Cart()
    
    var sessionCart = [Item]()
    var categoryList = [Category]()
    
    
    func addItem(_ itemToBeInserted : Item ) {
        
        sessionCart.append(itemToBeInserted)
    }
    
    
    func addCategory(_ categoryName : String, _ itemToInsert : Item)  {
        let categoryReturned = checkIfExistsCategory(categoryName)
        if categoryReturned.categoryName == "nil" {
            let category = Category(categoryName)
            categoryList.append(category)
            category.items.append(itemToInsert)
            
        } else {
            categoryReturned.items.append(itemToInsert)
        }
    }
    
    
    func removeItem(_ itemNameToBeRemoved : String) -> Bool? {
        var count = 0
        var flag = false
        for item in sessionCart{
            if item.itemName.lowercased() == itemNameToBeRemoved.lowercased() {
                sessionCart.remove(at: count)
                flag = true
                print("Item \(item.itemName) is removed from your cart !")
                break
            }
            count += 1
        }
        return flag
    }
    
    
    func searchItem(_ itemToBeSearched : String) -> [Item]? {
        var listOfItems = [Item]()
        for item in sessionCart {
            if itemToBeSearched.lowercased() == item.itemName.lowercased(){
                listOfItems.append(item)
            }
        }
        
        return listOfItems
    }
    
    
    func searchItemByCategory(_ itemToBeSearched : String) -> [Item]? {
        var listOfItems = [Item]()
        for item in sessionCart {
            if itemToBeSearched.lowercased() == item.category.lowercased(){
                listOfItems.append(item)
            }
        }
        
        return listOfItems
    }
    
    func listAllItems() -> [Item] {
        return sessionCart
    }
    
    func checkIfExistsCategory(_ category : String)  -> Category {
        
        var cateReturn : Category = Category("nil")
        
        for cat in categoryList {
            if cat.categoryName.lowercased() == category.lowercased() {
                cateReturn = cat
                break
            }
            
        }
        return cateReturn
    }
    
    
}
