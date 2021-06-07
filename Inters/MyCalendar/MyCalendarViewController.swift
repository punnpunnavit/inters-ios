//
//  MyCalendarViewController.swift
//  Inters
//
//  Created by Punnavit Tuntisangaroon on 24/3/2564 BE.
//

import UIKit

import UIKit
import FSCalendar
import iCarousel
class MyCalendarViewController: UIViewController,FSCalendarDelegate,FSCalendarDataSource,iCarouselDataSource,iCarouselDelegate {
   
    @IBOutlet weak var labelInCalendar: UILabel!
    let subjectsArr = [UIImage(named: "sqsatverbal"),UIImage(named: "sqsatmath"),UIImage(named: "sqtuget"),UIImage(named: "sqsatmathii"),UIImage(named: "sqsatphysics")]
   var calendar = FSCalendar()
   var formatter = DateFormatter()
    let myCarousel:iCarousel = {
        let view = iCarousel()
        view.type = .rotary
       // view.layer.cornerRadius = 20
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendar = FSCalendar(frame: CGRect(x: 0, y: 100, width: self.view.frame.size.width, height: 300))
        
        calendar.scrollDirection = .horizontal
        self.view.addSubview(calendar)
        calendar.delegate = self
        calendar.dataSource = self
        calendar.appearance.titleFont = UIFont.systemFont(ofSize: 15)
        calendar.appearance.headerTitleFont = UIFont.boldSystemFont(ofSize: 18)
        calendar.appearance.weekdayFont = UIFont.boldSystemFont(ofSize: 16)
        calendar.appearance.todayColor = .systemYellow
        calendar.appearance.titleTodayColor = .white
        calendar.appearance.titleDefaultColor = .systemOrange
        calendar.appearance.headerTitleColor = .systemOrange
        calendar.appearance.weekdayTextColor = .systemOrange
        calendar.appearance.selectionColor = .systemOrange
        calendar.appearance.eventDefaultColor = .systemRed
        calendar.appearance.eventSelectionColor = .systemRed
        view.addSubview(myCarousel)
        myCarousel.dataSource = self
        myCarousel.frame = CGRect(x: 150, y: 600, width: view.frame.size.width/4, height: 60)
        myCarousel.layer.cornerRadius = 20
        myCarousel.isScrollEnabled = false
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

    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        formatter.dateFormat = "dd-MM-yyyy"
        guard let eventDate = formatter.date(from: "27-02-2564")else{return 0}
        if date.compare(eventDate) == .orderedSame{
            
            return 2
        }
        return 0
    }
    
    
    //data source
    func minimumDate(for calendar: FSCalendar) -> Date {
        return Date()
    }

    func maximumDate(for calendar: FSCalendar) -> Date {
        return Date().addingTimeInterval((24*60*60)*60*10)
    }
    
    //delegate
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        formatter.dateFormat = "dd-MMM-yyyy"
        print(formatter.string(from: date))
        if formatter.string(from: date) == "27-Feb-2564"{
            labelInCalendar.text = "Today's event : SAT Math"
            myCarousel.currentItemIndex = 3
        }
    }
  //  calenda
    
    
    
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return subjectsArr.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: view?.frame.origin.y ?? 500 - 1500, width: self.view.frame.size.width/2, height: self.view.frame.size.width/2))
       // view.backgroundColor = .blue
        
        let imageView = UIImageView(frame: view.bounds)
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        //imageView.center = CGPoint(x: 50, y: 50)
        //view.center = CGPoint(x: 1000, y: -1000)
       // imageView.contentMode = .center
        
      //  text.backgroundColor = UIColor.white.withAlphaComponent(0.89)
        
//      //  self.view.frame = text.bounds.size.width
//        view = UIView(frame: CGRect(x: 50, y: -30, width:  self.view.frame.size.width/2, height: self.view.frame.size.width/2))
//        text.textAlignment = .center
       
        view.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.image = subjectsArr[index]
//        imageView.contentMode = .scaleAspectFit
//        imageView.image = UIImage(named: "einstein")
        return view
        
        
    }
    
    
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        if (option == .fadeMin)
           {
               return 0
           } else if (option == .fadeMinAlpha)
           {
               return 0.07
           } else if (option == .fadeMax)
           {
               return 0.07
           }

           return value
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}



    
    // MARK: - Public function
    
    /// downloadImage function will download the thumbnail images
    /// returns Result<Data> as completion handler

