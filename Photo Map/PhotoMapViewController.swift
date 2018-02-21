//
//  PhotoMapViewController.swift
//  Photo Map
//
//  Created by Nicholas Aiwazian on 10/15/15.
//  Copyright © 2015 Timothy Lee. All rights reserved.
//

import UIKit
import MapKit

class PhotoMapViewController: UIViewController, UIImagePickerController {

    @IBOutlet weak var mapKitView: MKMapView!
    var vc: UIImagePickerController!
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sfregion = MKCoordinateRegionMake(CLLocationCoordinate2DMake(37.783333, -122.416667), MKCoordinateSpanMake(0.1, 0.1))
        
        mapKitView.setRegion(sfregion, animated: false)
        // Do any additional setup after loading the view.
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onCameraPressed(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = self
       
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            print("camera is available")
            vc.sourceType = .camera
        }
        else{
            print("camera is not available. Using photolibrary")
            vc.sourceType = .photoLibrary
        }
        
        self.present(vc, animated: true, completion: nil)
    
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
        
        self.image = editedImage
        dismiss(animated: true, completion: nil)
        self.performSegue(withIdentifier: "tagSegue", sender: self)
    }
    
    open class func isSourceTypeAvailable(_ sourceType: UIImagePickerControllerSourceType) -> Bool // returns YES if source is available (i.e. camera present)

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
