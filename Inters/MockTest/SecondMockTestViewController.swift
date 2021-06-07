//
//  MockTestViewController.swift
//  Inters
//
//  Created by Punnavit Tuntisangaroon on 24/3/2564 BE.
//

import UIKit
class mocktestCell:UICollectionViewCell{

   
    @IBOutlet weak var imageInDisplayMockTest: UIImageView!

    func configure(with dataa:UIImage){
        imageInDisplayMockTest.image = dataa
        }

        override func layoutSubviews() {
            self.layer.cornerRadius = 15.0
            self.layer.borderWidth = 5.0
            self.layer.borderColor = UIColor.clear.cgColor
            self.contentMode = .scaleToFill
    }
}

class SecondMockTestViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {

    
    let data = [MockTestViewController.vc1.selectedImg,MockTestViewController.vc1.selectedImg,MockTestViewController.vc1.selectedImg,MockTestViewController.vc1.selectedImg,MockTestViewController.vc1.selectedImg]

   
    @IBOutlet weak var collectionViewMockTest: UICollectionView!
    //  @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionViewMockTest.delegate = self
        collectionViewMockTest.dataSource = self
        collectionViewMockTest.showsVerticalScrollIndicator = false
        collectionViewMockTest.contentMode = .scaleToFill

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

   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        if let a = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell2", for: indexPath) as? mocktestCell{
            a.configure(with: data[indexPath.row]!)
            print(data[indexPath.row])
            cell = a
        }
        cell.backgroundColor = .yellow
        cell.layoutIfNeeded()
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)

        switch indexPath.row{
        case 0:
            print("verbal")
            self.performSegue(withIdentifier: "goToPdf", sender: self)

        case 1:
            print("math1")
            self.performSegue(withIdentifier: "goToPdf", sender: self)
        case 2:
            print("cuaat")
            self.performSegue(withIdentifier: "goToPdf", sender: self)
        case 3:
            print("cuats")
            self.performSegue(withIdentifier: "goToPdf", sender: self)
        case 4:
            print("cutep")
            self.performSegue(withIdentifier: "goToPdf", sender: self)
        case 5:
            print("ged")
            self.performSegue(withIdentifier: "goToPdf", sender: self)
        case 6:
            print("gsat")
            self.performSegue(withIdentifier: "goToPdf", sender: self)
        case 7 :
            print("ielts")
            self.performSegue(withIdentifier: "goToPdf", sender: self)
        case 8:
            print("igcse")
            self.performSegue(withIdentifier: "goToPdf", sender: self)
        case 9:
            print("sat bio")
            self.performSegue(withIdentifier: "goToPdf", sender: self)
        case 10:
            print("sat chem")
            self.performSegue(withIdentifier: "goToPdf", sender: self)
        case 11:
            print("sat math 2")
            self.performSegue(withIdentifier: "goToPdf", sender: self)
        case 12:
            print("tuget")
            self.performSegue(withIdentifier: "goToPdf", sender: self)
        case 13:
            print("sat phy")
            self.performSegue(withIdentifier: "goToPdf", sender: self)
        case 14:
            print("alevel")
            self.performSegue(withIdentifier: "goToPdf", sender: self)
        default:
            print("error")
            self.performSegue(withIdentifier: "goToPdf", sender: self)
        }

    }





    
}

