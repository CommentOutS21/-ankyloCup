//
//  ExplaneViewController.swift
//  SampleApp
//
//  Created by 越智友香 on 2024/12/24.
//
import UIKit
import CoreMotion

class ExplaneViewController: UIViewController {
    
    let motionManager = CMMotionManager()
    
    @IBOutlet weak var Content: UILabel!
    @IBOutlet weak var Pitch: UILabel!
    @IBOutlet weak var Roll: UILabel!
    @IBOutlet weak var Yaw: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Content.text = "傾き"
        guard motionManager.isAccelerometerAvailable else { return }
        Pitch.text = "Pitch : "
        Roll.text = "Roll : "
        Yaw.text = "Yaw : "
        motionManager.accelerometerUpdateInterval = 1 / 100
        // 1秒間に100回
        motionManager.startDeviceMotionUpdates(to: OperationQueue.current!, withHandler: { (motion, error) in
            guard let motion = motion, error == nil else { return }

            self.Pitch.text = String(format: "Pitch: %.3f", floor((motion.attitude.pitch * 180 / Double.pi)*100)/100)
            self.Roll.text = String(format: "Roll: %.3f", floor((motion.attitude.roll * 180 / Double.pi)*100)/100)
            self.Yaw.text = String(format: "Yaw: %.3f", floor((motion.attitude.yaw * 180 / Double.pi)*100)/100)
//            print("attitude pitch: \(motion.attitude.pitch * 180 / Double.pi)")
//            print("attitude roll : \(motion.attitude.roll * 180 / Double.pi)")
//            print("attitude yaw  : \(motion.attitude.yaw * 180 / Double.pi)")

        })
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction private func backButtonAction() {
        dismiss(animated: true)
    }
    @IBAction private func stopMove(){
        motionManager.stopDeviceMotionUpdates()
    }
    @IBAction private func startMove(){
        motionManager.startDeviceMotionUpdates(to: OperationQueue.current!, withHandler: { (motion, error) in
        guard let motion = motion, error == nil else { return }

        self.Pitch.text = "Pitch: \(((motion.attitude.pitch * 180 / Double.pi)*100)/100)"
        self.Roll.text = String(format: "Roll: %.3f", floor((motion.attitude.roll * 180 / Double.pi)*100)/100)
        self.Yaw.text = "Yaw : \(motion.attitude.yaw * 180 / Double.pi)"
//            print("attitude pitch: \(motion.attitude.pitch * 180 / Double.pi)")
//            print("attitude roll : \(motion.attitude.roll * 180 / Double.pi)")
//            print("attitude yaw  : \(motion.attitude.yaw * 180 / Double.pi)")

    })
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
