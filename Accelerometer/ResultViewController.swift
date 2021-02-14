//
//  ResultViewController.swift
//  Accelerometer
//
//  Created by 八幡尚希 on 2021/02/07.
//

import UIKit

class ResultViewController: UIViewController {
    
    //accelerarionxを受け取っている
    var accelerationX: Double!
    
    @IBOutlet var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let result: Double = fabs(accelerationX*100)
        label.text = String(format: "%.1f" , result)

        // Do any additional setup after loading the view.
    }
    

}
