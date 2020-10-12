//
//  ViewController.swift
//  DAY5BIT14
//
//  Created by Jlius Suweno on 05/10/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var myTable: UITableView!
    
    var myArray = [["Nama" : "Jeje", "Lokasi" : "Palembang"],
                   ["Nama" :"Andy","Lokasi" : "Surabaya"],
                   ["Nama" :"Brosky", "Lokasi" : "Jakarta"],
                   ["Nama" :"Andrew","Lokasi" : "Bekasi"]]
    var identityModelArray: [IdentityObject] = []
    var optionalString : String?
    var mandatoryString : String = "Default"
    //    var images: [Image] = []
    var pickedImage : UIImage?
    
    let pickerController: UIImagePickerController = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initArrayOfIdentity()
        pickerController.delegate = self
        if let savedImages = Image.loadImages() {
            images = savedImages
        } else {
            images = Image.loadSampleImages()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell") as! MyTableViewCell
        cell.backgroundColor = UIColor.blue
        cell.myLabel1.text = identityModelArray[indexPath.row].nama
        cell.myLabel2.text = identityModelArray[indexPath.row].lokasi
        
        cell.myImageView.image = pickedImage
//
//        if let imageFromCache = imageCache.object(forKey: images[indexPath.row].recordID as AnyObject) as? UIImage {
//            cell.myImageView.image = imageFromCache
//        } else {
//            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.75) {
//                // 获取cell真正的indexPath.
//                if let index = tableView.indexPath(for: cell) {
//                    if let data = images[index.row].imageData {
//                        let imageToCache = UIImage(data: data)
//                        // 给缓存添加照片
//                        imageCache.setObject(imageToCache!, forKey: images[indexPath.row].recordID! as AnyObject)
//                        cell.myImageView.image = UIImage(data: data)
//                        cell.setNeedsLayout()
//                    }
//                }
//            }
//        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func initArrayOfIdentity(){
        for identity in myArray {
            let idObject = IdentityObject()
            idObject.nama = identity["Nama"]
            idObject.lokasi = identity["Lokasi"]!
            identityModelArray.append(idObject)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        pickedImage = info[.originalImage] as? UIImage
        picker.dismiss(animated: true, completion: nil)
        myTable.reloadData()
    }
    
    @IBAction func uploadFromGallery(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            pickerController.sourceType = .photoLibrary
            pickerController.allowsEditing = false
            self.present(pickerController, animated: true, completion: nil)
        } else {
            print("Device not support photo library")
        }
    }
    
    @IBAction func openCamera(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            pickerController.sourceType = .camera
            pickerController.allowsEditing = false
            self.present(pickerController, animated: true, completion: nil)
        } else {
            print("Device not support camera")
        }
    }
}
