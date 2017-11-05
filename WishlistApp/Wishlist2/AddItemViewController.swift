//
//  AddItemViewController.swift
//  Wishlist2
//
//  Created by Pushkar Khedekar on 10/30/17.
//  Copyright © 2017 Pushkar Khedekar. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    
    @IBOutlet weak var itemNameTextField: UITextField!
    @IBOutlet weak var itemDescriptionTextField: UITextField!
    
    @IBOutlet weak var itemPriceTextField: UITextField!
    @IBOutlet weak var itemStoreNameTextField: UITextField!
    @IBOutlet weak var itemStoreAddressTextField: UITextField!
    @IBOutlet weak var itemStoreContactTextField: UITextField!
    @IBOutlet weak var itemCategoryTextField: UITextField!

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        itemNameTextField.text=""
        itemDescriptionTextField.text=""
        itemPriceTextField.text=""
        itemStoreContactTextField.text=""
        itemStoreAddressTextField.text=""
        itemStoreNameTextField.text=""
        itemCategoryTextField.text=""
    }

    func dismissKeyboard() {
        view.endEditing(true)
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "closeCreate", sender: self)
    }
    
    @IBAction func createButtonPressed(_ sender: Any) {
        if checkIsValid() == 1 {
            let store = Store(itemStoreNameTextField.text!,itemStoreAddressTextField.text!, Int64(itemStoreContactTextField.text!)!)
            
            let item = Item(itemNameTextField.text!, itemDescriptionTextField.text!, Int(itemPriceTextField.text!)!, store, itemCategoryTextField.text!)
            Cart.cart.addCategory(itemCategoryTextField.text!, item)
            Cart.cart.addItem(item)
            createAlert("Congratulations","Item added successfully !")
            resetButtonPressed(self)
            
        } else  if checkIsValid() == 2{
            
            createAlert("Empty fields","Please enter all details")
            
        } else if checkIsValid() == 3{
            
            
            createAlert("Invalid Price","Please enter a valid price ")
            itemPriceTextField.text = ""
        } else if checkIsValid() == 4{
            
            createAlert("Invalid Contact Info","Please enter a valid contact info")
            itemStoreContactTextField.text = ""
        }
        
    }
    
    
    func checkIsValid() -> Int {
        if itemNameTextField.text == "" || itemPriceTextField.text == "" || itemDescriptionTextField.text == "" || itemCategoryTextField.text == "" || itemStoreNameTextField.text == "" || itemStoreAddressTextField.text == "" || itemStoreContactTextField.text == "" {
            return 2
        } else if Int(itemPriceTextField.text!) == nil{
            return 3
        } else if Int64(itemStoreContactTextField.text!) == nil{
            return 4
        }
        return 1;
    }
    
    func createAlert(_ title : String,_ message : String){
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { action in }
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true) {}
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
