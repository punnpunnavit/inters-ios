//
//  MenuViewController.swift
//  Inters
//
//  Created by Punnavit Tuntisangaroon on 24/3/2564 BE.
//

import UIKit

class MenuViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate,PinterestLayoutDelegate {
   
    
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        switch indexPath.row{
        case 0:
            return 300
        case 1:
            return 220
        case 2:
            return 180
        case 3:
            return 250
        case 4:
            return 220
        case 5:
            return 230
        case 6:
            
            return 220
            
        default:
            return 220
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row{
        case 0:
            if let storiesUrl = URL(string: "instagram-stories://share"){
                if UIApplication.shared.canOpenURL(storiesUrl){
                    
                    
                    let leftOverDays = 100
                    let selectedSubject = "Default"
                    let countdownView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
                    countdownView.backgroundColor = .black
                    let countdownText = UILabel(frame: CGRect(x: 10, y: 10, width: countdownView.frame.width - 30, height: countdownView.frame.height - 30))
                    countdownText.font = UIFont(name: "AvenirNext-Bold", size: 12)
                    countdownText.textAlignment = .center
                    countdownText.text = "Countdown\n\(leftOverDays)\nDays\n\(selectedSubject)"
                    
                    guard let image = UIImage(named: "noimg1") else{return}
                    guard let imageData = image.pngData() else {return}
                    let pasteBoardItems:[String:Any] = [
                        "com.instagram.sharedSticker.stickerImage":imageData,
                        "com.instagram.sharedSticker.backgroundTopColor":"#394667",
                        "com.instagram.sharedSticker.backgroundBottomColor":"#394667"
                        
                    ]
                    let pasteBoardOptions = [
                        UIPasteboard.OptionsKey.expirationDate: Date().addingTimeInterval(300)
                    ]
                    UIPasteboard.general.setItems([pasteBoardItems], options: pasteBoardOptions)
                    UIApplication.shared.open(storiesUrl, options: [:], completionHandler: nil)
                    
                }else{
                    print("user doesn't have instagram")
                }
            }
        case 1:
            self.performSegue(withIdentifier: "goToMyCourse", sender: self)
        case 2:
            self.performSegue(withIdentifier: "goToScoreCal", sender: self)
        case 3:
            self.performSegue(withIdentifier: "goToFlashcard", sender: self)
        case 4:
            self.performSegue(withIdentifier: "goToMockTest", sender: self)
        case 5:
            self.performSegue(withIdentifier: "goToChecklist", sender: self)
        case 6:
            self.performSegue(withIdentifier: "goToRequirement", sender: self)
        default:
            self.performSegue(withIdentifier: "goToMyCalendar", sender: self)
        }
    }
    
    
    let dataModel = [1,2,3,4,5,6,7,8]
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataModel.count
    }
    let objects = ["Countdown", "My Course", "Score Calculation","Flashcards", "Mock Test", "Checklist","Requirements", "My Calendar"]
    let descriptionInCell = ["Your Course Your Journey!","Calculate your score now!","Test your skills","Practice with our mock tests","Make sure you know these","See what it takes to get accepted","Plan your next moves"]
    let imgInMenuCell = [UIImage(named: "menuMyCourse"),UIImage(named: "menuScoreCal"),UIImage(named: "menuFlashcard"),UIImage(named: "menuMockTest"),UIImage(named: "menuCheckList"),UIImage(named: "menuRequirements"),UIImage(named: "menuCalendar")]
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as! CustomMenuCollectionViewCell
        let infoInCell = UILabel(frame: CGRect(x: 0, y: 0, width: cell.frame.width - 15, height: cell.frame.height))
       
        
        
        infoInCell.font = UIFont(name: "AvenirNext-Bold", size: 12)
        cell.contentView.addSubview(infoInCell)
        cell.label.text = self.objects[indexPath.item]
        cell.label.textAlignment = .center
        switch indexPath.row{
        case 0:
            cell.backgroundColor = UIColor(hexString: "#34456d")
            cell.label.textColor = .white
            
            
        case 1:
            cell.backgroundColor = .white
            cell.layer.borderWidth = 1
            cell.layer.borderColor = UIColor.black.cgColor
            cell.label.font = cell.label.font.withSize(20)
            let displayImg = UIImageView(image: imgInMenuCell[indexPath.row - 1])
            cell.addSubview(displayImg)
           
            cell.label.frame.origin = CGPoint(x: -8, y: -10)
            infoInCell.frame.origin = CGPoint(x: 15, y: -50)
            
            infoInCell.text = descriptionInCell[indexPath.row-1]
//            layoutPic(view: displayImg, cell: cell, topConstant: 100, bottomConstant: 0, trailingConstant: 50)
        layoutPic(view: displayImg, cell: cell, topConstant: 105, bottomConstant: 0, trailingConstant: 50, leftConstant: 18, rightConstant: -18)
        
        case 2:
            cell.backgroundColor = .white
            cell.layer.borderWidth = 1
            cell.layer.borderColor = UIColor.black.cgColor
            infoInCell.text = descriptionInCell[indexPath.row-1]
            cell.label.textColor = .black
            cell.label.font = cell.label.font.withSize(18)
           
            cell.label.frame.origin = CGPoint(x: 15, y: -16)
            infoInCell.frame.origin = CGPoint(x: 15, y: -40)
            let displayImg = UIImageView(image: imgInMenuCell[indexPath.row - 1])
            cell.addSubview(displayImg)
            layoutPic(view: displayImg, cell: cell, topConstant: 40, bottomConstant: 10, trailingConstant: 50, leftConstant: 18, rightConstant: -18)
            
        case 3:
            cell.backgroundColor = UIColor(hexString: "#7c6466")
            cell.label.textColor = .white
            infoInCell.textColor = .white
            infoInCell.text = descriptionInCell[indexPath.row-1]
            cell.label.frame.origin = CGPoint(x: 10, y: -3)
            infoInCell.frame.origin = CGPoint(x: 21, y: -58)
            cell.addSubview(UIImageView(image: imgInMenuCell[indexPath.row - 1]))
            let displayImg = UIImageView(image: imgInMenuCell[indexPath.row - 1])
            cell.addSubview(displayImg)
            layoutPic(view: displayImg, cell: cell, topConstant: 80, bottomConstant: 0, trailingConstant: 50, leftConstant: 15, rightConstant: -7)
        case 4:
            cell.backgroundColor = UIColor(hexString: "#644b6e")
            infoInCell.text = descriptionInCell[indexPath.row-1]
            cell.label.textColor = .white
            infoInCell.textColor = .white
            let displayImg = UIImageView(image: imgInMenuCell[indexPath.row - 1])
            cell.addSubview(displayImg)
            layoutPic(view: displayImg, cell: cell, topConstant: 85, bottomConstant: -10, trailingConstant: 50, leftConstant: 18, rightConstant: -18)
            cell.label.frame.origin = CGPoint(x: -8, y: -10)
            infoInCell.frame.origin = CGPoint(x: 15, y: -50)

        case 5:
            cell.backgroundColor = .white
            cell.layer.borderWidth = 1
            cell.layer.borderColor = UIColor.black.cgColor
            infoInCell.text = descriptionInCell[indexPath.row-1]
            let displayImg = UIImageView(image: imgInMenuCell[indexPath.row - 1])
            cell.addSubview(displayImg)
            layoutPic(view: displayImg, cell: cell, topConstant: 75, bottomConstant: 15, trailingConstant: 50, leftConstant: 5, rightConstant: 0)
            cell.label.frame.origin = CGPoint(x: -8, y: -10)
            infoInCell.frame.origin = CGPoint(x: 15, y: -50)

        case 6:
            cell.backgroundColor = .white
            cell.layer.borderWidth = 1
            cell.layer.borderColor = UIColor.black.cgColor
            infoInCell.text = descriptionInCell[indexPath.row-1]
            let displayImg = UIImageView(image: imgInMenuCell[indexPath.row - 1])
            cell.addSubview(displayImg)
            layoutPic(view: displayImg, cell: cell, topConstant: 75, bottomConstant: 0, trailingConstant: 50, leftConstant: 10, rightConstant: -10)
            cell.label.frame.origin = CGPoint(x: -8, y: -10)
            infoInCell.frame.origin = CGPoint(x: 15, y: -50)

            
        case 7:
            cell.backgroundColor = UIColor(hexString: "#536c5f")
            infoInCell.text = descriptionInCell[6]
            cell.label.textColor = .white
            infoInCell.textColor = .white
        
        
        default:
           print("")

        }
        cell.layer.cornerRadius = 15
               return cell
    
    }
    
    func layoutPic(view:UIImageView,cell:UICollectionViewCell,topConstant:CGFloat,bottomConstant:CGFloat,trailingConstant:CGFloat,leftConstant:CGFloat,rightConstant:CGFloat){
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: cell.topAnchor,constant: topConstant).isActive = true
        view.bottomAnchor.constraint(equalTo: cell.bottomAnchor,constant: bottomConstant).isActive = true
        view.trailingAnchor.constraint(equalTo: cell.trailingAnchor,constant: trailingConstant).isActive = true
        view.leftAnchor.constraint(equalTo: cell.leftAnchor,constant: leftConstant).isActive = true
        view.rightAnchor.constraint(equalTo: cell.rightAnchor,constant: rightConstant).isActive = true
        view.heightAnchor.constraint(equalToConstant: view.bounds.height).isActive = true
        view.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
    }
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(UINib(nibName:"CustomMenuCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "menuCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
        
        if let layout = collectionView.collectionViewLayout as? PinterestLayout{
            layout.delegate = self
        }
        
        
    }
    


}

