//
//  AddViewController.swift
//  Galleria
//
//  Created by Pramodya Abeysinghe on 31/3/19.
//  Copyright © 2019 Pramodya. All rights reserved.
//

import UIKit
import CoreData

class AddViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    
    var pc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var item: Photo? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        btn1.layer.cornerRadius = 5
        btn2.layer.cornerRadius = 5
        btn3.layer.cornerRadius = 5
        
        if item == nil {
            self.navigationItem.title = "Add New Photo"
        } else {
            self.navigationItem.title = item?.textTitle
            btn3.setTitle("Update", for: .normal)
            
            titleField.text = item?.textTitle
            descriptionField.text = item?.textDescription
            imageView.image = UIImage(data: (item?.image)! as Data)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func dismissKB(_ sender: Any) {
        self.resignFirstResponder()
    }
    
    @IBAction func library(_ sender: Any) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        pickerController.allowsEditing = true
        
        self.present(pickerController, animated: true, completion: nil)
    }
    
    @IBAction func camera(_ sender: Any) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = UIImagePickerController.SourceType.camera
        pickerController.allowsEditing = true
        
        self.present(pickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = image
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        
        guard let title = titleField.text, !title.isEmpty else {
            self.simpleAlert(message: "Title is required")
            return
        }
        
        if item == nil {
            let entityDescription = NSEntityDescription.entity(forEntityName: "Photo", in: pc)
            let item = Photo(entity: entityDescription!, insertInto: pc)
            
            item.textTitle = titleField.text
            item.textDescription = descriptionField.text
            item.image = imageView.image?.pngData() as NSData?
        } else {
            item?.textTitle = titleField.text
            item?.textDescription = descriptionField.text
            item?.image = imageView.image?.pngData() as NSData?
        }
        
        do {
            try pc.save()
        } catch {
            debugPrint(error.localizedDescription)
            return
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    func simpleAlert(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
        
        
    }
    
}
