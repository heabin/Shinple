//
//  NavigationController.swift
//  Shinple
//
//  Created by user on 21/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    
        let colorStartBlue = UIColor(red: 15/255, green: 83/255, blue: 163/255, alpha: 1)
        let colorMiddleBlue = UIColor(red: 20/255, green: 123/255, blue: 195/255, alpha: 1)
        let colorEndBlue = UIColor(red: 27/255, green: 164/255, blue: 227/255, alpha: 1)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //setupGradientLayer()
        self.navigationBar.tintColor = .white
        
        let gradient = CAGradientLayer()
        var bounds = navigationBar.bounds
        bounds.size.height += UIApplication.shared.statusBarFrame.size.height
        
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradient.frame = bounds
        gradient.colors = [colorStartBlue.cgColor, colorMiddleBlue.cgColor, colorEndBlue.cgColor]
        gradient.locations = [0.1,0.5,1.0]
        
        if let image = getImageFrom(gradientLayer: gradient) {
            navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
        }
        
        //self.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationBar.shadowImage = UIImage()
    }
    
    func getImageFrom(gradientLayer:CAGradientLayer) -> UIImage? {
        var gradientImage:UIImage?
        UIGraphicsBeginImageContext(gradientLayer.frame.size)
        if let context = UIGraphicsGetCurrentContext() {
            gradientLayer.render(in: context)
            gradientImage = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch)
        }
        UIGraphicsEndImageContext()
        
        return gradientImage
    }
    
    
    
//    private func setupGradientLayer(){
//        let colorStartBlue = UIColor(red: 20/255, green: 118/255, blue: 192/255, alpha: 1)
//        let colorMiddleBlue = UIColor(red: 20/255, green: 123/255, blue: 195/255, alpha: 1)
//        let colorEndBlue = UIColor(red: 27/255, green: 164/255, blue: 227/255, alpha: 1)
//        let gradientLayer = CAGradientLayer()
//
//        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
//        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
//        gradientLayer.frame = navigationBar.layer.bounds
//        gradientLayer.colors = [colorStartBlue.cgColor, colorMiddleBlue.cgColor, colorEndBlue.cgColor]
//        gradientLayer.locations = [0.1,0.3,1.0]
//
//        navigationBar.layer.insertSublayer(gradientLayer, at: 0)
//        //navigationBar.layer.addSublayer(gradientLayer)
//    }
    
    

}
