//
//  ViewController.swift
//  FinalAssC0772733
//
//  Created by MacStudent on 2020-01-24.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
     var products : [Product]?
  @IBOutlet var textFields: [UITextField]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        loadCoreData()
    }
    
  
    func saveCoreData(){
       clearCoreData()
           let appDelegate = UIApplication.shared.delegate as! AppDelegate

           let managedContext = appDelegate.persistentContainer.viewContext
           
           for  product in products!
           {
               let proEntity = NSEntityDescription.insertNewObject(forEntityName: "Products", into: managedContext)
               proEntity.setValue(product.name, forKey: "name")
               proEntity.setValue(product.desc, forKey: "desc")
                proEntity.setValue(product.id, forKey: "id")
                proEntity.setValue(product.price, forKey: "price")
               
               // save context
               do{
                   try managedContext.save()
               }catch{
                   print(error)
               }
           }
       }
    
    func clearCoreData(){
            // create an instance of app delegate
           let appDelegate = UIApplication.shared.delegate as! AppDelegate
                      // second step is context
                               
           let managedContext = appDelegate.persistentContainer.viewContext
                      
           let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Product")
           
           fetchRequest.returnsObjectsAsFaults = false
           do{
               let results = try managedContext.fetch(fetchRequest)
               for manageObjects in results{
                   if let managedObjectData = manageObjects as? NSManagedObject
                   {
                       managedContext.delete(managedObjectData)
                   }
                   
               }
           }catch{
               print(error)
           }
       }
    
    
    func loadCoreData(){
                 products = [Product]()
                
                 let appDelegate = UIApplication.shared.delegate as! AppDelegate
                
                 let managedContext = appDelegate.persistentContainer.viewContext
                 
                 let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Products")
                 
                 do{
                     let results = try managedContext.fetch(fetchRequest)
                     if results is [NSManagedObject]{
                         for result in results as! [NSManagedObject]{
                             let name = result.value(forKey: "name") as! String
                             let desc = result.value(forKey: "desc") as! String
                             let id = result.value(forKey: "id") as! Int
                             let price = result.value(forKey: "price") as! Float
                            products?.append(Product(name: name, id: id, desc: desc, price: Float(price)))
                         }
                     }
                 }catch{
                     print(error)
                 }
                 
             }
    
    @IBAction func addProduct(_ sender: UIButton) {
          let id = Int(textFields[0].text ?? "0") ?? 0
           let name  = textFields[1].text ?? ""
           let desc =  textFields[2].text ?? ""
           let price = Int(textFields[3].text ?? "0") ?? 0
          
        let product =  Product(name: name, id: id, desc: desc, price: Float(price))
          
          products?.append(product)
          
          for textField in textFields{
                    textField.text = ""
                    textField.resignFirstResponder()
                }
      }
       

}

