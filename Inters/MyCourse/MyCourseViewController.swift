//
//  MyCourseViewController.swift
//  Inters
//
//  Created by Punnavit Tuntisangaroon on 24/3/2564 BE.
//

import UIKit

class MyCourseViewController: UIViewController {
    
   
    
    @IBOutlet weak var backBtn: UIButton!
    @IBAction func backBtnClicked(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        let selectedImg = UIImage(systemName: "chevron.backward")?.resizedImage(Size: CGSize(width: 20, height: 20))
        //selectedImg?.withTintColor(.white)
        let selectedImgView = UIImageView(image: selectedImg)
        selectedImgView.image = selectedImgView.image?.withRenderingMode(.alwaysTemplate)
        selectedImgView.tintColor = UIColor.yellow
        
        let button = UIButton(type: .custom)
        button.tintColor = .white
        button.setImage(selectedImgView.image, for: .normal)
        button.backgroundColor = UIColor(hexString: "#f7cb6b")
        button.addTarget(self, action: #selector(popBack), for: .touchUpInside)
        print(selectedImgView.frame.width)
        print(selectedImgView.frame.height)
        button.frame = CGRect(x: 0, y: 0, width: selectedImgView.frame.width + 25 , height: selectedImgView.frame.height + 50)
        print(button.frame.width)
        print(button.frame.height)
        button.layer.cornerRadius = button.frame.width/2
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.leftBarButtonItem = barButton
    }
    

    @objc func popBack(){
        _ = navigationController?.popViewController(animated: true)
    }

}
extension UIImage
{
   func resizedImage(Size sizeImage: CGSize) -> UIImage?
   {
       let frame = CGRect(origin: CGPoint.zero, size: CGSize(width: sizeImage.width, height: sizeImage.height))
       UIGraphicsBeginImageContextWithOptions(frame.size, false, 0)
       self.draw(in: frame)
       let resizedImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
       UIGraphicsEndImageContext()
       self.withRenderingMode(.alwaysOriginal)
       return resizedImage
   }
}
