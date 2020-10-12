//
//  SecondViewController.swift
//  DAY5BIT14
//
//  Created by Jlius Suweno on 05/10/20.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var longText: UILabel!
    @IBOutlet weak var latText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
        let myURLRequest = UrlRequestBuilder().buildUrlRequestGetReport(date: "2020-10-04", iso: "IDN")
        RestWebService().sendRequest(urlRequest: myURLRequest, input: nil) {
            json, error in
            DispatchQueue.main.sync {
                if error != nil {
                    
                } else {
                    let dict = json as! Dictionary<String, Any>
                    print(dict)
                    if let dictData = dict["data"] as? [[String:Any]],
                       let dists = dictData.first {
                        print(dists["date"]!)
                        print(dists["confirmed"]!)
                        print(dists["deaths"]!)
                        print(dists["recovered"]!)
                        print(dists["active"]!) // the value is an optional.
                        
                        if let region = dictData.first?["region"] as? [String: Any],
                        let disct = region.first {
                            print(region["lat"]!)
                            print(region["long"]!)
                            self.latText.text = "\(region["lat"]!)"
                            self.longText.text = "\(region["long"]!)"
                        }
                    }
                    
                }
            }
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

}
