//
//  HomeViewController.swift
//  Inters
//
//  Created by Punnavit Tuntisangaroon on 22/3/2564 BE.
//

import UIKit
import BLTNBoard
struct CustomData{
    var tile: String
    var image : UIImage
}

class HomeViewController:UIViewController,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    
    var item = BLTNPageItem(title: "Help")
    var name = ""
    var url = ""
    let descriptionBLTN = ["aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa","bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb","ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc"]
    
    @IBOutlet weak var imgInHome: UIImageView!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var greetingLbl: UILabel!
    //ads
    @IBOutlet weak var collectionView222: UICollectionView!
   
    @IBOutlet weak var pageControl: UIPageControl!
    var arrProductPhotos = [UIImage(named: "ad1"),UIImage(named: "ad2"),UIImage(named: "ad1")]

    var timer:Timer?
    var currentCellIndex = 0
   
    private lazy var boardManager:BLTNItemManager = {
        item.actionButtonTitle = "Dismiss"
        item.appearance.actionButtonColor = UIColor.systemYellow
        item.actionHandler = {_ in
            ScoreCalculationViewController.didTapBoardContinue()
        }
        
        item.alternativeHandler = { _ in
            ScoreCalculationViewController.didTapBoardSkip()
            
        }
    
        item.appearance.alternativeButtonTitleColor = .gray
        
        
        return BLTNItemManager(rootItem: item)
    }()
    
    static func didTapBoardContinue(){
        
    }
    
    static func didTapBoardSkip(){
        
    }
    
    

    
    
    
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(moveToNextIndex), userInfo: nil, repeats: true)
    }

    @objc func moveToNextIndex(){
        if currentCellIndex < arrProductPhotos.count-1 {
            currentCellIndex += 1
        }else{
            currentCellIndex = 0
        }

        collectionView222.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
        pageControl.currentPage = currentCellIndex
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView222 == collectionView{
            return arrProductPhotos.count
        }else{
            return data.count
        }
           

    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView222 == collectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! CollectionViewCell

             cell.imgProductPhoto.image = arrProductPhotos[indexPath.row]
             cell.imgProductPhoto.layer.cornerRadius = 10
            
                 return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
            let firstImg = UIImageView(image: UIImage(named: "allCourseImg"))
            let secondImg = UIImageView(image: UIImage(named: "freeVideosImg"))
            let thirdImg = UIImageView(image: UIImage(named: "myCourseImg"))
            let title = UILabel(frame: CGRect(x: 10, y: 0, width: cell.bounds.size.width, height: 50))
            title.font = UIFont(name: "AvenirNext-Bold", size: 22)
            
            let subTitle = UILabel(frame: CGRect(x: 10, y: 40, width: cell.bounds.size.width, height: 20))
            subTitle.font = UIFont(name: "AvenirNext-Bold", size: 10)
            
            
           
            switch indexPath.row {
            case 0:
                cell.backgroundColor = UIColor(hexString: "#f7cb6b")
                title.text = "All Courses"
                subTitle.text = "Explore new courses !"
                cell.contentView.addSubview(subTitle)
                cell.contentView.addSubview(title)
                cell.addSubview(firstImg)
                firstImg.translatesAutoresizingMaskIntoConstraints = false
                firstImg.topAnchor.constraint(equalTo: cell.topAnchor,constant: 60).isActive = true
                firstImg.bottomAnchor.constraint(equalTo: cell.bottomAnchor,constant: 30).isActive = true
                firstImg.trailingAnchor.constraint(equalTo: cell.trailingAnchor,constant: 50).isActive = true
                firstImg.leftAnchor.constraint(equalTo: cell.leftAnchor).isActive = true
                firstImg.rightAnchor.constraint(equalTo: cell.rightAnchor).isActive = true
                firstImg.heightAnchor.constraint(equalToConstant: firstImg.bounds.height).isActive = true
                firstImg.widthAnchor.constraint(equalToConstant: firstImg.bounds.width).isActive = true
            case 1:
                cell.backgroundColor = UIColor(hexString: "#6fa6dd")
                title.text = "Free Videos"
                subTitle.text = "It's time to study !"
                cell.contentView.addSubview(subTitle)
                cell.contentView.addSubview(title)
                cell.addSubview(secondImg)
                secondImg.translatesAutoresizingMaskIntoConstraints = false
                secondImg.topAnchor.constraint(equalTo: cell.topAnchor,constant: 65).isActive = true
                secondImg.bottomAnchor.constraint(equalTo: cell.bottomAnchor,constant: 30).isActive = true
                secondImg.trailingAnchor.constraint(equalTo: cell.trailingAnchor,constant: 50).isActive = true
                secondImg.leftAnchor.constraint(equalTo: cell.leftAnchor).isActive = true
                secondImg.rightAnchor.constraint(equalTo: cell.rightAnchor).isActive = true
                secondImg.heightAnchor.constraint(equalToConstant: firstImg.bounds.height).isActive = true
                secondImg.widthAnchor.constraint(equalToConstant: firstImg.bounds.width).isActive = true
            default:
                cell.backgroundColor = UIColor(hexString: "#ff7765")
                title.text = "My Courses"
                subTitle.text = "Keep on studying !"
                cell.contentView.addSubview(subTitle)
                cell.contentView.addSubview(title)
                cell.addSubview(thirdImg)
                thirdImg.translatesAutoresizingMaskIntoConstraints = false
                thirdImg.topAnchor.constraint(equalTo: cell.topAnchor,constant: 70).isActive = true
                thirdImg.bottomAnchor.constraint(equalTo: cell.bottomAnchor,constant: 30).isActive = true
                thirdImg.trailingAnchor.constraint(equalTo: cell.trailingAnchor,constant: 50).isActive = true
                thirdImg.leftAnchor.constraint(equalTo: cell.leftAnchor).isActive = true
                thirdImg.rightAnchor.constraint(equalTo: cell.rightAnchor).isActive = true
                thirdImg.heightAnchor.constraint(equalToConstant: firstImg.bounds.height).isActive = true
                thirdImg.widthAnchor.constraint(equalToConstant: firstImg.bounds.width).isActive = true
            }
            cell.layer.cornerRadius = 15
            return cell
        }



    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView222 == collectionView{
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }else{
            return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
        }
       


    }
    

    
    
    
    
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView222 == collectionView{
            self.item.imageView?.layer.cornerRadius = 50
            switch indexPath.row{
            case 0:
                self.item.descriptionText = self.descriptionBLTN[indexPath.row]
                self.item.imageView?.layer.cornerRadius = 50
                self.item.image = arrProductPhotos[indexPath.row]
                self.boardManager.showBulletin(above: self)
            case 1:
                self.item.descriptionText = self.descriptionBLTN[indexPath.row]
                self.item.imageView?.layer.cornerRadius = 50
                self.item.image = arrProductPhotos[indexPath.row]
                self.boardManager.showBulletin(above: self)
            case 2:
                self.item.descriptionText = self.descriptionBLTN[indexPath.row]
                self.item.imageView?.layer.cornerRadius = 50
                self.item.image = arrProductPhotos[indexPath.row]
                self.boardManager.showBulletin(above: self)
            default:
                
                self.boardManager.showBulletin(above: self)
            }
            
        
            ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// ///////////////////////////////////// /////////////////////////////////////
            
            
        }else{
            self.performSegue(withIdentifier: "comingSoon", sender: self)
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView222 == collectionView{
            return 0
        }else{
            return 20
        }
       
    }

   //course
    let data = [CustomData(tile: "All Course", image: #imageLiteral(resourceName: "allCourseImg")),CustomData(tile: "Free Videos", image: #imageLiteral(resourceName: "freeVideosImg")),CustomData(tile: "My Course", image: #imageLiteral(resourceName: "myCourseImg"))]
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: .zero,collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        view.addSubview(collectionView)
        self.item.imageView?.layer.cornerRadius = 50
        //get user pic and name
        print("sfihohwiOhegiphIwehgiphwpeihgipHweigpIpheipHeipgh//////////////////////////////")
        print(LoginScreenViewController.vc1.name)
        print("sfihohwiOhegiphIwehgiphwpeihgipHweigpIpheipHeipgh//////////////////////////////")
        
        
        //get date
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        let yearString = dateFormatter.string(from: date)
        dateFormatter.dateFormat = "LLLL"
        let monthString = dateFormatter.string(from: date)
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: date)
        let dayOfMonth = components.day!
        dateLbl.text = "\(dayOfMonth) \(monthString) \(yearString)"
        
        //get hour
        let hour = Calendar.current.component(.hour, from: Date())
        if LoginScreenViewController.vc1.name == "" {
            LoginScreenViewController.vc1.name = "user"
        }else if LoginScreenViewController.vc1.name != nil{
        }else{
            LoginScreenViewController.vc1.name = "user"
        }
        switch hour {
        case 6..<12 :
            greetingLbl.text = "Good Morning,\(LoginScreenViewController.vc1.name)"
        case 12..<17 :
            greetingLbl.text = "Good Afternoon,\(LoginScreenViewController.vc1.name)"
        case 17..<22 :
            greetingLbl.text = "Good Evening,\(LoginScreenViewController.vc1.name)"
        default:
            greetingLbl.text = "Good Night,\(LoginScreenViewController.vc1.name)"
        }
        
        //get user profile
        imgInHome.image = UIImage(named: "man")
        imgInHome.backgroundColor = .gray
        imgInHome.layer.cornerRadius = imgInHome.frame.height / 2
        
        
        
        
        collectionView.backgroundColor = .white
        collectionView.topAnchor.constraint(equalTo: view.topAnchor,constant: 280).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 40).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -40).isActive = true
        collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor,multiplier: 0.5).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 13).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -15).isActive = true
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.delegate = self
        collectionView.dataSource = self

        //ads
        collectionView222.delegate = self
        collectionView222.dataSource = self
        pageControl.numberOfPages = arrProductPhotos.count
        startTimer()
        collectionView222.reloadData()
        view.bringSubviewToFront(pageControl)
    }
}


class CustomCell :UICollectionViewCell{
}
class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgProductPhoto: UIImageView!
    override func layoutSubviews() {
        // cell rounded section
        self.layer.cornerRadius = 15.0
        self.layer.borderWidth = 5.0
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.masksToBounds = true
        
        // cell shadow section
        self.contentView.layer.cornerRadius = 15.0
        self.contentView.layer.borderWidth = 5.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0.0)
        self.layer.shadowRadius = 6.0
        self.layer.shadowOpacity = 0.6
        self.layer.cornerRadius = 15.0
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath

}
}

extension UIImage {

func resize(targetSize: CGSize) -> UIImage {
    return UIGraphicsImageRenderer(size:targetSize).image { _ in
        self.draw(in: CGRect(origin: .zero, size: targetSize))
    }
}

}

class ComingSoon:UIViewController{
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
