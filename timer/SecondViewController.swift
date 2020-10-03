//
//  SecondViewController.swift
//  timer
//
//  Created by Takuya Nomura on 2020/10/03.
//

import UIKit

class SecondViewController: UIViewController {
    var DataImage:[UIImage] = [
        UIImage(named: "image6")!
    ]
    var TodayIndex:Int = 0
    
    var x : UIImage!
    let rect:CGRect = CGRect(x:0, y:0, width:200, height:300)
    
    @IBOutlet weak var UpImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UpImage.frame = rect
        UpImage.image = x
        
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
