//
//  DetailViewController.swift
//  SlideshowApp
//
//  Created by new torigoe on 2019/02/27.
//  Copyright © 2019 new torigoe. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detail: UIImageView!
    //デフォルトは１個目
    var x:Int = 1
    let img1 = UIImage(named:"comments")!
    let img2 = UIImage(named:"folder")!
    let img3 = UIImage(named:"linux-logo")!
    let img4 = UIImage(named:"mirror")!
    override func viewDidLoad() {
        super.viewDidLoad()
        switch x {
        case 1:
            detail.image = img1
        case 2:
            detail.image = img2
        case 3:
            detail.image = img3
        case 4:
            x = 1
            detail.image = img1

            
        default:
            detail.image = img1;
        }
        
        // Do any additional setup after loading the view.
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
