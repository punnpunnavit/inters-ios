//
//  ScoreCalculationViewController.swift
//  Inters
//
//  Created by Punnavit Tuntisangaroon on 24/3/2564 BE.
//

import UIKit
import iCarousel
import BLTNBoard

class ScoreCalculationViewController: UIViewController, iCarouselDataSource, iCarouselDelegate {
    
  
    var selectedSubject = "default"
    var selectionArr = ["SAT Math"]
    let subjectsArr = ["SAT Math","SAT Verbal","SAT Physics","SAT Math II","SAT Biology","SAT Chemistry","IELTS","GED","BMAT","CU-TEP","CU-AAT","CU-ATS","TU-GET"]
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return subjectsArr.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        var view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width/4, height: 60))
        view.backgroundColor = .blue
        let text = UILabel(frame: view.bounds)


        text.text = subjectsArr[index]
        
        view = UIView(frame: CGRect(x: 50, y: -30, width:   text.bounds.size.width - 100, height: text.bounds.size.height))
        text.textAlignment = .center

        view.addSubview(text)
        return view
    }
    
    
    func carouselDidEndScrollingAnimation(_ carousel: iCarousel) {
        if myCarousel == carousel{
        print(subjectsArr[carousel.currentItemIndex])
        selectionArr[0] = subjectsArr[carousel.currentItemIndex]
        }else{}
    }

    let myCarousel:iCarousel = {
        let view = iCarousel()
        view.type = .rotary
        return view
    }()
    
    
    //footer view
    private lazy var boardManager:BLTNItemManager = {
        let item = BLTNPageItem(title: "Push Notifications")
        item.image = UIImage(systemName: "scalemass")
        item.actionButtonTitle = "Continue"
        item.alternativeButtonTitle = "nah"
        item.descriptionText = "12wfwuegfgwefuehifhepqf"
        item.actionHandler = {_ in
            ScoreCalculationViewController.didTapBoardContinue()
        }
        
        item.alternativeHandler = { _ in
            ScoreCalculationViewController.didTapBoardSkip()
            
        }
        
        item.appearance.actionButtonColor = .systemPink
        item.appearance.alternativeButtonTitleColor = .gray
        
        
        return BLTNItemManager(rootItem: item)
    }()
    
    static func didTapBoardContinue(){
        
    }
    
    static func didTapBoardSkip(){
        
    }
    
    
    
    //end
    @IBAction func forwardBtnClicked(_ sender: Any) {
    }
    
    @IBAction func backBtnClicked(_ sender: Any) {
    }
    @IBOutlet weak var upperLbl: UILabel!
    @IBOutlet weak var upperView: UIView!
    @IBOutlet weak var lowerLbl: UILabel!
    
    @IBOutlet weak var rightSlider: UISlider!
    @IBOutlet weak var wrongSlider: UISlider!
    
    @IBAction func rightSliderMoved(_ sender: Any) {
        upperLbl.text = "Got it right \(Int(rightSlider.value)) questions"
    }
    
    @IBAction func wrongSliderMoved(_ sender: Any) {
        lowerLbl.text = "Got it wrong \(Int(wrongSlider.value)) questions"
    }
    
    
    
    @IBAction func calculateClicked(_ sender: Any) {
        
        boardManager.showBulletin(above: self)
        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        print("smmsmsososmomsomsmos")
        print(SubSelectScoreCalViewController.vc1.selectedSubjectLabel!)
        print("smmsmsososmomsomsmos")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        upperView.layer.borderColor = UIColor.black.cgColor
        upperView.layer.cornerRadius = 10
        upperView.layer.borderWidth = 1
        upperView.backgroundColor = .clear
        rightSlider.maximumValue = 70
        rightSlider.minimumValue = 0
        wrongSlider.maximumValue = 70
        wrongSlider.minimumValue = 0
        view.addSubview(myCarousel)
        
        myCarousel.dataSource = self
        myCarousel.delegate = self
        myCarousel.frame = CGRect(x: 30, y: 250, width: view.frame.size.width/2, height: 60)
        myCarousel.backgroundColor = .clear
        upperView.bringSubviewToFront(myCarousel)
        
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
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        if myCarousel == carousel{
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
    
//    if myCarousel == carousel{
//    if (option == .fadeMin)
//       {
//           return 0
//       } else if (option == .fadeMinAlpha)
//       {
//           return 0.04
//       } else if (option == .fadeMax)
//       {
//           return 0.04
//       }
//       return value
//    }else{
//        if (option == .fadeMin)
//           {
//               return 0
//           } else if (option == .fadeMinAlpha)
//           {
//               return 0
//           } else if (option == .fadeMax)
//           {
//               return 0
//           }
//           return value
//
//    }
    
}

    


