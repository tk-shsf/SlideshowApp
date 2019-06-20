//
//  ExViewController.swift
//  SlideshowApp
//
//  Created by Takuya Hatakeyama on 2019/06/12.
//  Copyright © 2019 Takuya Hatakeyama. All rights reserved.
//

import UIKit

class ExViewController: UIViewController {
   
    @IBOutlet weak var exImage: UIImageView!
    
    @IBAction func onUnWind(_ sender: Any) {
        
    }
    
    
    var image1:UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exImage.image = image1
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
