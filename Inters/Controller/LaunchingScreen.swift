//
//  LaunchingScreen.swift
//  Inters
//
//  Created by Punnavit Tuntisangaroon on 20/3/2564 BE.
//

import UIKit

class LaunchingScreen: UIViewController {
    
    
    let layer = CAShapeLayer()
    let layer2 = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawCamera()
        drawTriangle()
        addAnimation()
    }
    
    
    func addAnimation(){
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 1.25
        
        layer.add(animation, forKey: "line")
        layer2.add(animation, forKey: "line")
        
        Timer.scheduledTimer(timeInterval: 1.25, target: self, selector:#selector(callAnimation(sender:)), userInfo: nil, repeats:false)
        
    }
    
    
    func drawCamera(){
        layer.path = translate(path: LaunchScreenView.createCameraLine().cgPath, by: CGPoint(x: -70, y: 0))
        layer.frame = view.bounds
        layer.strokeColor = UIColor(hexString: "#FF9300").cgColor
        layer.lineWidth = 5
        layer.fillColor = UIColor.clear.cgColor
        view.layer.addSublayer(layer)
    }
    
    func drawTriangle(){
        layer2.path = translate(path: LaunchScreenView.createTriangleLine().cgPath, by: CGPoint(x: -70, y: 0))
        layer2.strokeColor = UIColor(hexString: "#FF9300").cgColor
        layer2.lineWidth = 5
        layer2.fillColor = UIColor.clear.cgColor
        view.layer.addSublayer(layer2)
    }
    
    
    @objc func callAnimation(sender: Timer) {
        layer.fillColor = UIColor.yellow.cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        // make sure to use .cgColor
        gradientLayer.colors = [UIColor(hexString: "FFBF17").cgColor, UIColor(hexString: "FF5672").cgColor]
        gradientLayer.frame = view.bounds
        gradientLayer.mask = layer
        
        view.layer.addSublayer(gradientLayer)
        
        // Corner radius
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        layer2.fillColor = UIColor.white.cgColor
        layer2.strokeColor = UIColor.clear.cgColor
        view.layer.insertSublayer(layer2, above: layer)
        Timer.scheduledTimer(timeInterval: 2, target: self, selector:#selector(toLoginScreen(sender:)), userInfo: nil, repeats:false)
    }
    
    @objc func toLoginScreen(sender: Timer) {
        self.performSegue(withIdentifier: "toLogin", sender: self)
    }
    
    
    func translate(path : CGPath?, by point: CGPoint) -> CGPath? {
        
        let bezeirPath = UIBezierPath()
        guard let prevPath = path else {
            return nil
        }
        bezeirPath.cgPath = prevPath
        bezeirPath.apply(CGAffineTransform(translationX: point.x, y: point.y))
        
        return bezeirPath.cgPath
    }
    
    
    
    
    
}
