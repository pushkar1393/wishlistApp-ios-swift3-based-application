//
//  AddItemController.swift
//  WishListApp
//
//  Created by Pushkar Khedekar on 11/12/17.
//  Copyright © 2017 Pushkar Khedekar. All rights reserved.
//

import UIKit

class AddItemController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var itemNameTextField: UITextField!
    @IBOutlet weak var itemDescriptionTextField: UITextField!
    @IBOutlet weak var itemPriceTextField: UITextField!
    @IBOutlet weak var itemStoreNameTextField: UITextField!
    @IBOutlet weak var itemStoreContactTextField: UITextField!
    @IBOutlet weak var itemStoreAddressTextField: UITextField!
    @IBOutlet weak var itemCategoryTextField: UITextField!
    
    
    @IBOutlet weak var imageContainer: UIImageView!
    var itemImage : UIImage?
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        imageContainer.image = nil
        itemNameTextField.text=""
        itemDescriptionTextField.text=""
        itemPriceTextField.text=""
        itemStoreNameTextField.text=""
        itemStoreContactTextField.text=""
        itemStoreAddressTextField.text=""
        itemCategoryTextField.text=""
    }
    
    @IBAction func imageAddButtonPressed(_ sender: Any) {
        let picker = UIImagePickerController()
        
        picker.delegate = self
        let libController = UIAlertController(title: "Photo Source", message: "", preferredStyle: .actionSheet)
        
        libController.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action:UIAlertAction) in
            picker.sourceType = .photoLibrary
            self.present(picker, animated: true, completion: nil)
        }))
        
        libController.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        self.present(libController, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        itemImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        imageContainer.image = itemImage
        picker.dismiss(animated: true, completion: nil)
        
        
    }

    @IBAction func createButtonPressed(_ sender: Any) {
        
        if checkIsValid() == 1 {
            let store = Store(itemStoreNameTextField.text!.lowercased(),itemStoreAddressTextField.text!.lowercased(), Int64(itemStoreContactTextField.text!)!)
            
            let item = Item(itemNameTextField.text!.lowercased(), itemDescriptionTextField.text!.lowercased(), Int(itemPriceTextField.text!)!, store, itemCategoryTextField.text!.lowercased(),itemImage!)
            Cart.cart.addCategory(itemCategoryTextField.text!, item)
            //Cart.cart.addItem(item)
            var flag = DataPersistenceManager.storeItem(item)
            if flag == true {
            createAlert("Congratulations","Item added successfully !")
            resetButtonPressed(self)
            } else {
                createAlert("Duplicate Item", "Please enter a different item name")
                itemNameTextField.text = ""
            }
            
        } else  if checkIsValid() == 2{
            
            createAlert("Empty fields","Please enter all details")
            
        } else if checkIsValid() == 3{
            
            
            createAlert("Invalid Price","Please enter a valid price ")
            itemPriceTextField.text = ""
        } else if checkIsValid() == 4{
            
            createAlert("Invalid Contact Info","Please enter a valid contact info")
            itemStoreContactTextField.text = ""
        
        } else if checkIsValid() == 5{
            createAlert("Image Missing", "Upload an Image")
        }
        
    }
    
    
    // function to perform field validations
    func checkIsValid() -> Int {
        if itemNameTextField.text == "" || itemPriceTextField.text == "" || itemDescriptionTextField.text == "" || itemCategoryTextField.text == "" || itemStoreNameTextField.text == "" || itemStoreAddressTextField.text == "" || itemStoreContactTextField.text == "" {
            return 2
        } else if Int(itemPriceTextField.text!) == nil{
            return 3
        } else if Int64(itemStoreContactTextField.text!) == nil{
            return 4
        
        } else if itemImage == nil {
            return 5
        }
        return 1;
    }
    
    
    
    // function to pop up an alert
    func createAlert(_ title : String,_ message : String){
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { action in }
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true) {}
    }

    
    
    

}
