//
//  ViewController.swift
//  SlideshowApp
//
//  Created by new torigoe on 2019/02/27.
//  Copyright © 2019 new torigoe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timer: Timer!
    var number:Int! = 0
    var status:Bool! = true
    var backtype:Bool! = true
    @IBOutlet weak var selectimage: UIImageView!
    @IBOutlet weak var next1: UIButton!
    @IBOutlet weak var back1: UIButton!
    @IBOutlet weak var play1: UIButton!
    let img1 = UIImage(named:"comments")!
    let img2 = UIImage(named:"folder")!
    let img3 = UIImage(named:"linux-logo")!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.back1.isEnabled = true
        self.next1.isEnabled = true
        
    }

    @IBAction func next1(_ sender: Any) {
        number = number + 1
        
        switch number {
        case 1:
            selectimage.image = img1
        case 2:
            selectimage.image = img2
        case 3:
            selectimage.image = img3
        case 4:
            number = 1
            selectimage.image = img1
        case .some(_):
            break
        case .none: break
            
        }
    }
    
    @IBAction func back1(_ sender: Any) {
        if(number > 0) {
            number = number - 1
        }
        switch number {
        case 0:
            selectimage.image = img3
            number = 3
        case 1:
            selectimage.image = img1
        case 2:
            selectimage.image = img2
        case 3:
            selectimage.image = img3
        case 4:
            number = 1
            selectimage.image = img1
        case .some(_):
            break
        case .none: break
            
        }

    }
    
    @IBAction func play1(_ sender: Any) {
        backtype = false
        if(status == true) {
            status = false
            self.back1.isEnabled = false
            self.next1.isEnabled = false
            play1.setTitle("停止", for: .normal)
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(autoChange(_:)), userInfo: nil, repeats: true)
            
            
        } else {
            status = true
            self.back1.isEnabled = true
            self.next1.isEnabled = true
            play1.setTitle("再生", for: .normal)
            if self.timer != nil {
                self.timer.invalidate()
                self.timer = nil
            }
        }
    }
    @objc func autoChange(_ sender: Any) {
        number = number + 1
        
        switch number {
        case 1:
            selectimage.image = img1
        case 2:
            selectimage.image = img2
        case 3:
            selectimage.image = img3
        case 4:
            number = 1
            selectimage.image = img1
        case .some(_):
            break
        case .none: break
            
        }
    }
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        // 他の画面から segue を使って戻ってきた時に呼ばれる
        if(backtype == false) {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(autoChange(_:)), userInfo: nil, repeats: true)
            self.back1.isEnabled = false
            self.next1.isEnabled = false
            play1.setTitle("停止", for: .normal)
        }
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let detailViewController:DetailViewController = segue.destination as! DetailViewController
        // 遷移先のDetailViewControllerで宣言しているx, yに値を代入して渡す
        detailViewController.x = number!
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
        }

    }
    
}

