//
//  FlashcardViewController.swift
//  Inters
//
//  Created by Punnavit Tuntisangaroon on 24/3/2564 BE.
//

import UIKit
import iCarousel

    class FlashcardViewController: UIViewController, iCarouselDataSource, iCarouselDelegate {

        var isOpen = false
        let myCarousel:iCarousel = {
            let view = iCarousel()
            view.type = .rotary
            return view
        }()
        
        let bigFlashCardCarousel :iCarousel = {
            let view = iCarousel()
            view.type = .linear
            return view
        }()
        
        var selectionArr = ["Easy","SAT Math"]
        let subjectsArr = ["SAT Math","SAT Verbal","SAT Physics","SAT Math II","SAT Biology","SAT Chemistry","IELTS","GED","BMAT","CU-TEP","CU-AAT","CU-ATS","TU-GET"]
        
        @IBAction func playBtnTapped(_ sender: Any) {
            playBtn.setTitle("Next", for: .normal)
        }
        var level = 0
        
        @IBOutlet weak var playBtn: UIButton!
        @IBAction func levelBtnTapped(_ sender: Any) {
            if level == 0{
                levelBtn.setTitle("Medium", for: .normal)
                selectionArr[0] = "Medium"
                level += 1
            }
            else if level == 1{
                levelBtn.setTitle("Hard", for: .normal)
                selectionArr[0] = "Hard"
                level += 1
            }
            else{
                levelBtn.setTitle("Easy", for: .normal)
                selectionArr[0] = "Easy"
                level = 0
            }
        
        }
       
        @IBOutlet weak var levelBtn: UIButton!
        
        @IBOutlet weak var cardBtn: UIButton!
        
        @IBAction func cardTapped(_ sender: Any) {
                        if isOpen{
            
                            let image = UIImage(named: "qqq")
                            cardBtn.setImage(image, for: .normal)
                            cardBtn.reloadInputViews()
                            UIView.transition(with: cardBtn, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                            isOpen.toggle()
                        }
                        else{
            
                            let image = UIImage(named: "ans")
                            cardBtn.setImage(image, for: .normal)
                            cardBtn.reloadInputViews()
                            UIView.transition(with: cardBtn, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
                            isOpen.toggle()
            
                        }
            
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
        
          
            lockOrientation(.landscape,andRotateTo: .landscapeRight)
            self.tabBarController?.tabBar.isHidden = true
            view.addSubview(myCarousel)
            view.addSubview(bigFlashCardCarousel)
            bigFlashCardCarousel.delegate = self
            bigFlashCardCarousel.dataSource = self
            myCarousel.dataSource = self
            myCarousel.delegate = self
            myCarousel.frame = CGRect(x: 290, y: 330, width: view.frame.size.width/2, height: 60)
            bigFlashCardCarousel.frame = CGRect(x: 150, y: 30, width: 600, height: 300)
            
            self.navigationController?.setNavigationBarHidden(false, animated: true)
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
            
            navigationItem.title = "Select the test"
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
        
        override func viewWillDisappear(_ animated: Bool) {
            lockOrientation(.all,andRotateTo: .portrait)
            self.tabBarController?.tabBar.isHidden = false
        }
        func lockOrientation(_ orientation:UIInterfaceOrientationMask, andRotateTo rotateOrientation:UIInterfaceOrientation? = nil){
            if let delegate = UIApplication.shared.delegate as? AppDelegate{
                delegate.orientationLock = orientation
            }
            if let rotateOrientation = rotateOrientation{
                UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
            }
        }

        func numberOfItems(in carousel: iCarousel) -> Int {
            if myCarousel == carousel{
                return subjectsArr.count
            }else{
                return subjectsArr.count
            }
            
        }

        func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
            if myCarousel == carousel{
            var view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width/6, height: 60))
            view.backgroundColor = .blue
            let text = UILabel(frame: view.bounds)


            text.text = subjectsArr[index]
            
            view = UIView(frame: CGRect(x: 50, y: -30, width:   text.bounds.size.width - 100, height: text.bounds.size.height))
            text.textAlignment = .center

            view.addSubview(text)
            return view
            }else{
                var bigView = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 300))
                bigView.backgroundColor = .white
                bigView.layer.borderColor = UIColor.black.cgColor
                bigView.layer.borderWidth = 1
                bigView.layer.cornerRadius = 9
                view?.addSubview(bigView)
                let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
                label.center = CGPoint(x: 160, y: 285)
                label.textAlignment = .center
                label.text = "I'm a test label"
                bigView.addSubview(label)
                bigView.isUserInteractionEnabled = true
                let gesture = MyTapGesture(target: self, action: #selector(self.tapped(sender:)))
                bigView.addGestureRecognizer(gesture)
                gesture.requiredView = bigView
                return bigView
            }

        }
        
        @objc func tapped(sender:MyTapGesture) {
            if isOpen{

                UIView.transition(with: sender.requiredView!, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                isOpen.toggle()
            }
            else{

                
                UIView.transition(with: sender.requiredView!, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
                isOpen.toggle()

            }
            }

        func carouselDidEndScrollingAnimation(_ carousel: iCarousel) {
            if myCarousel == carousel{
            print(subjectsArr[carousel.currentItemIndex])
            selectionArr[1] = subjectsArr[carousel.currentItemIndex]
            }else{}
        }

        func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
            if myCarousel == carousel{
            if (option == .fadeMin)
               {
                   return 0
               } else if (option == .fadeMinAlpha)
               {
                   return 0.04
               } else if (option == .fadeMax)
               {
                   return 0.04
               }
               return value
            }else{
                if (option == .fadeMin)
                   {
                       return 0
                   } else if (option == .fadeMinAlpha)
                   {
                       return 0
                   } else if (option == .fadeMax)
                   {
                       return 0
                   }
                   return value
               
            }
            
        }

    }








extension FlashcardViewController : UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if touch.view!.superview!.superclass! .isSubclass(of: UIButton.self) {
            return false
        }
        return true
    }
}

class MyTapGesture: UITapGestureRecognizer {
     var requiredView: UIView?
}
