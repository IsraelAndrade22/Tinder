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
        
        if sender.state == .began {
            cardInitialCenter = profileImage.center
            
        } else if sender.state == .changed {
            profileImage.center = CGPoint(x: cardInitialCenter.x, y: cardInitialCenter.y + translation.y)
            
        } else if sender.state == .ended {
            
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
