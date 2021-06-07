//
//  ChecklistViewController.swift
//  Inters
//
//  Created by Punnavit Tuntisangaroon on 24/3/2564 BE.
//

//import UIKit
//class checklistCell:UICollectionViewCell{
//
//
//
//    @IBOutlet weak var checkListImgCell: UIImageView!
//
//
//    func configure(with dataa:UIImage){
//        checkListImgCell.image = dataa
//        }
//
//        override func layoutSubviews() {
//            // cell rounded section
//            self.layer.cornerRadius = 15.0
//            self.layer.borderWidth = 5.0
//            self.layer.borderColor = UIColor.clear.cgColor
//            self.layer.masksToBounds = true
//
//            // cell shadow section
//            self.contentView.layer.cornerRadius = 15.0
//            self.contentView.layer.borderWidth = 5.0
//            self.contentView.layer.borderColor = UIColor.clear.cgColor
//            self.contentView.layer.masksToBounds = true
//            self.layer.shadowColor = UIColor.white.cgColor
//            self.layer.shadowOffset = CGSize(width: 0, height: 0.0)
//            self.layer.shadowRadius = 6.0
//            self.layer.shadowOpacity = 0.6
//            self.layer.cornerRadius = 15.0
//            self.layer.masksToBounds = false
//            self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
//
//
//
//
//
//
//
//    }
//}
//
//class ChecklistViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
//
//
//    @IBOutlet weak var checklistCollectionView: UICollectionView!
//    //  @IBOutlet weak var collectionView: UICollectionView!
//    let data = [UIImage(named: "satverbalsquare"),UIImage(named: "satmathsquare"),UIImage(named: "cuaatsquare"),UIImage(named: "cuatssquare"),UIImage(named: "cutepsquare"),UIImage(named: "gedsquare"),UIImage(named: "gsatsquare"),UIImage(named: "ieltssquare"),UIImage(named: "igcsesquare"),UIImage(named: "satbioisquare"),UIImage(named: "satchemsquare"),UIImage(named: "satmathlv2square"),UIImage(named: "tugetsquare"),UIImage(named: "satphysicssquare"),UIImage(named: "alevelsquare")]
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        checklistCollectionView.delegate = self
//        checklistCollectionView.dataSource = self
//        checklistCollectionView.showsVerticalScrollIndicator = false
//
//        self.navigationController?.setNavigationBarHidden(false, animated: true)
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//
//        navigationItem.title = "Select the test"
//        let selectedImg = UIImage(systemName: "chevron.backward")?.resizedImage(Size: CGSize(width: 20, height: 20))
//        //selectedImg?.withTintColor(.white)
//        let selectedImgView = UIImageView(image: selectedImg)
//        selectedImgView.image = selectedImgView.image?.withRenderingMode(.alwaysTemplate)
//        selectedImgView.tintColor = UIColor.yellow
//
//        let button = UIButton(type: .custom)
//        button.tintColor = .white
//        button.setImage(selectedImgView.image, for: .normal)
//        button.backgroundColor = UIColor(hexString: "#f7cb6b")
//        button.addTarget(self, action: #selector(popBack), for: .touchUpInside)
//        print(selectedImgView.frame.width)
//        print(selectedImgView.frame.height)
//        button.frame = CGRect(x: 0, y: 0, width: selectedImgView.frame.width + 25 , height: selectedImgView.frame.height + 50)
//        print(button.frame.width)
//        print(button.frame.height)
//        button.layer.cornerRadius = button.frame.width/2
//        let barButton = UIBarButtonItem(customView: button)
//        self.navigationItem.leftBarButtonItem = barButton
//    }
//
//    @objc func popBack(){
//        _ = navigationController?.popViewController(animated: true)
//    }
//
//
//
//   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return data.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        var cell = UICollectionViewCell()
//        if let a = collectionView.dequeueReusableCell(withReuseIdentifier: "checklistCell", for: indexPath) as? checklistCell{
//            a.configure(with: data[indexPath.row]!)
//            print(data[indexPath.row])
//            cell = a
//        }
//        cell.backgroundColor = .black
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print(indexPath.row)
//        switch indexPath.row{
//        case 0:print("22")
//
//        case 2:print("22")
//            //self.performSegue(withIdentifier: "gotocal", sender: self)
//         case 3:print("22")
//           // self.performSegue(withIdentifier: "gotoflashcard", sender: self)
//            case 4:print("22")
//               // self.performSegue(withIdentifier: "gotocalendar", sender: self)
//        case 5:print("22")
//           // self.performSegue(withIdentifier: "gotorequirements", sender: self)
//        case 6:print("66")
//        case 7 :print("77")
//        default:print("88")
//
//        }
//
//    }
//
//
//
//
//
//
//}
//
//
