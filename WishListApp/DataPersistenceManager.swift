//
//  File.swift
//  WishListApp
//
//  Created by Pushkar Khedekar on 11/28/17.
//  Copyright © 2017 Pushkar Khedekar. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DataPersistenceManager: NSObject {
    
    private class func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    class func checkIfExists(_ itemToCheck: String) -> Bool {
        var flag : Bool = false
        var item = retrieveItem(itemToCheck)
        if item != nil {
            flag = true
        }
        return flag
    }
    
    class func storeItem(_ itemToPersist : Item) -> Bool {
        var flag: Bool = false
        if checkIfExists(itemToPersist.itemName) == false{
        let context = getContext()
        
        let item_entity = NSEntityDescription.entity(forEntityName: "Item_Entity", in: context)
        
        let item_To_Store = NSManagedObject(entity: item_entity!, insertInto: context)
        
        item_To_Store.setValue(itemToPersist.itemName, forKey: "itemName")
        item_To_Store.setValue(itemToPersist.itemDescription, forKey: "itemDescription")
        item_To_Store.setValue(itemToPersist.itemPrice, forKey: "itemPrice")
        item_To_Store.setValue(itemToPersist.store.storeName, forKey: "storeName")
        item_To_Store.setValue(itemToPersist.store.storeAddress, forKey: "storeAddress")
        item_To_Store.setValue(itemToPersist.store.storeContact, forKey: "storeContact")
        item_To_Store.setValue(itemToPersist.category, forKey: "category")
        item_To_Store.setValue(itemToPersist.itemImage, forKey: "itemImage")
        do {
            try context.save()
            print("saved")
            flag = true
        } catch{
            print(error.localizedDescription)
        }
    }
        return flag
    }
    
    class func retrieveItemList() -> [Item]{
        var retrievedList = [Item]()
        
        let fetchItems:NSFetchRequest<Item_Entity> = Item_Entity.fetchRequest()
        
        do{
            let list = try getContext().fetch(fetchItems)
            
            for item in list {
                let store = Store(item.storeName!, item.storeAddress!, item.storeContact)
                let item = Item(item.itemName!, item.itemDescription!, Int(item.itemPrice), store,item.category!, item.itemImage as! UIImage)
                retrievedList.append(item)
            }
            
        }catch{
            print(error.localizedDescription)
        }
        return retrievedList
    }
    
    
    class func retrieveItem(_ itemToRetrieve:String) -> Item?{
        var viewItem: Item?
        
        let fetchItem:NSFetchRequest<Item_Entity> = Item_Entity.fetchRequest()
        
        var predicate = NSPredicate(format: "itemName == %@", itemToRetrieve)
        
        
        fetchItem.predicate = predicate
        
        do {
            let itemToView = try getContext().fetch(fetchItem)
            
            for item in itemToView {
                let store = Store(item.storeName!, item.storeAddress!, item.storeContact)
                 viewItem = Item(item.itemName!, item.itemDescription!, Int(item.itemPrice), store,item.category!, item.itemImage as! UIImage)
                
            }
        }catch {
            print(error.localizedDescription)
        }
        
        return viewItem
    }
    
    class func deleteItem(_ itemToDelete:String) {
        
        let fetchItem:NSFetchRequest<Item_Entity> = Item_Entity.fetchRequest()
        
        var predicate = NSPredicate(format: "itemName == %@", itemToDelete)
        fetchItem.predicate = predicate
        
        let removeItem = NSBatchDeleteRequest(fetchRequest: fetchItem as! NSFetchRequest<NSFetchRequestResult>)
        
        do {
            
            try getContext().execute(removeItem)
        }catch {
            print(error.localizedDescription)
        }
        
    }
    
    
    class func clearData()  {
        let fetchItems = NSFetchRequest<NSFetchRequestResult>(entityName: "Item_Entity")
        
        
        let deleteAll = NSBatchDeleteRequest(fetchRequest: fetchItems)
        
        do {
            try getContext().execute(deleteAll)
            
        } catch {
                print(error.localizedDescription)
        }
    }
}
