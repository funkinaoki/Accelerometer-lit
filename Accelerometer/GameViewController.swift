//
//  GameViewController.swift
//  Accelerometer
//
//  Created by 八幡尚希 on 2021/02/07.
//

import UIKit
import CoreMotion

class GameViewController: UIViewController {
    
    @IBOutlet var awaImageView: UIImageView!
    
    let motionManager = CMMotionManager()
    var accelerationX: Double = 0.0
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if motionManager.isAccelerometerAvailable {
            motionManager.accelerometerUpdateInterval = 0.01
            motionManager.startAccelerometerUpdates(to: OperationQueue.current!) {data, error in
                
                self.accelerationX = (data?.acceleration.x)!
                self.awaImageView.center.x += CGFloat(self.accelerationX*20)
                
                if self.awaImageView.frame.origin.x < -20 {
                    self.awaImageView.frame.origin.x = -20
                }
                if self.awaImageView.frame.origin.x > 210 {
                    self.awaImageView.frame.origin.x = 210
                }
            }
        }

        // Do any additional setup after loading the view.
    }
    
    //accelerationXの受け渡し
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        resultViewController.accelerationX = self.accelerationX
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
