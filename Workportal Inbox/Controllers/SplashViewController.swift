//
//  SplashViewController.swift
//  Workportal Inbox
//
//  Created by trink2 on 9/3/17.
//  Copyright © 2017 Bizagi. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    private var animationsCount = 0
    private var animationsTotal = 6

    @IBOutlet weak var logoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startLogoAnimation()
    }

    func startLogoAnimation() {

        var icon: Icon
        animationsCount += 1
        
        if animationsCount % 2 == 0 {
            icon = .bizagiGreen
        } else {
            icon = .bizagiOrange
        }
        
        UIView.transition(with: logoImageView, duration: 1.0, options: .transitionFlipFromLeft, animations: { [weak self] in
            self?.logoImageView.image = icon.image
        }, completion: { _ in
            if self.animationsCount == self.animationsTotal {
                self.performSegue(withIdentifier: "showInbox", sender: nil)
                return
            }
            
            self.startLogoAnimation()
        })
    }

}
