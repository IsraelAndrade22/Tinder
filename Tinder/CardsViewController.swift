//
//  CardsViewController.swift
//  Tinder
//
//  Created by Israel Andrade on 3/28/18.
//  Copyright © 2018 Israel Andrade. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    var cardInitialCenter: CGPoint!
    
    @IBOutlet weak var profileImage: UIImageView!
    var rotaion = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func didDragCard(_ sender: UIPanGestureRecognizer) {
        let location = sender.location(in: view)
        let translation = sender.translation(in: view)
        print("translation \(translation)")
        let velocity = sender.velocity(in: view)
        
//If the x translation is greater than 50, animate it off screen to the right. If the x translation is less than 50, animate it off screen to the left
        if sender.state == .began {
            cardInitialCenter = profileImage.center
            
        } else if sender.state == .changed {
            if(translation.x > 0)
            {
                if(location.y > cardInitialCenter.y){
                    self.rotaion -= 0.3

                }
                else {
                    self.rotaion += 0.3

                }
                profileImage.transform = CGAffineTransform(rotationAngle: CGFloat(self.rotaion * M_PI / 180))

            }
            else {
                if(location.y < cardInitialCenter.y){
                    self.rotaion += 0.3

                }
                else {
                    self.rotaion -= 0.3

                }
                var negative = -1.0 * self.rotaion
                profileImage.transform = CGAffineTransform(rotationAngle: CGFloat(negative * M_PI / 180))

            }
//            profileImage.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y + translation.y)

            
        } else if sender.state == .ended {
            if translation.x > 50 {
                //right
                UIView.animate(withDuration: 0.3) {
                    self.profileImage.center =
                        CGPoint(x: self.cardInitialCenter.x + 500 ,y: self.cardInitialCenter.y)
                }
            }else if(translation.x < 50){
                //left
                UIView.animate(withDuration: 0.3) {
                    //self.profileImage.center
                    self.profileImage.center =
                        CGPoint(x: self.cardInitialCenter.x - 500 ,y: self.cardInitialCenter.y)
                }
                
            }
            else {
                self.rotaion = 0
                profileImage.center = cardInitialCenter
                profileImage.transform = CGAffineTransform(rotationAngle: CGFloat(0 * M_PI / 180))
            }
            profileImage.transform = CGAffineTransform.identity

            //view.transform = CGAffineTransform.identity
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
