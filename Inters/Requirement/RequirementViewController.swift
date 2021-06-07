//
//  RequirementViewController.swift
//  Inters
//
//  Created by Punnavit Tuntisangaroon on 24/3/2564 BE.
//

import PDFKit
import UIKit
import XLPagerTabStrip
import iCarousel

class Requirements: ButtonBarPagerTabStripViewController{
    
    @IBAction func goToMenu(_ sender: Any) {
    }
    override func viewWillAppear(_ animated: Bool) {
    }
    override func viewDidLoad() {
        configureButtonBar()
        super.viewDidLoad()
        view.bringSubviewToFront(buttonBarView)
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Configuration
    func configureButtonBar() {
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white
        
        settings.style.buttonBarItemFont = UIFont(name: "Helvetica", size: 16.0)!
        settings.style.buttonBarItemTitleColor = .gray
        
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        
        settings.style.selectedBarHeight = 3.0
        settings.style.selectedBarBackgroundColor = .black
        // Changing item text color on swipe
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .gray
            newCell?.label.textColor = .black
            
        }
        
        
    }
    
    // MARK: - PagerTabStripDataSource
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child1 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChildViewController") as! ChildViewController
        
        let child2 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChildViewController2") as! ChildViewController2
        
        let child3 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChildViewController3") as! ChildViewController3
        
        return [child1, child2]
    }
    
}

class ChildViewController: UIViewController, IndicatorInfoProvider,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,iCarouselDataSource,iCarouselDelegate {
    
    func carousel(_ carousel: iCarousel, didSelectItemAt index: Int) {
        print(2222)
        self.performSegue(withIdentifier: "fromcu", sender: self)
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        collectionView222.delegate = self
        collectionView222.dataSource = self
        myCarousel.delegate = self
        pageControl.numberOfPages = arrProductPhotos.count
        startTimer()
        collectionView222.reloadData()
        view.addSubview(myCarousel)
        myCarousel.dataSource = self
        myCarousel.frame = CGRect(x: 150, y: 300, width: view.frame.size.width/4, height: 60)
        view.bringSubviewToFront(myCarousel)
        view.bringSubviewToFront(pageControl)
        myCarousel.isUserInteractionEnabled = true
        myCarousel.centerItemWhenSelected = false
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "CU")
    }
    
    //adsssssssssssssssssss
    
    
    @IBOutlet weak var collectionView222: UICollectionView!
    
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var arrProductPhotos = [UIImage(named: "ad1"),UIImage(named: "ad2"),UIImage(named: "ad1"),UIImage(named: "ad2")]
    
    var timer:Timer?
    var currentCellIndex = 0
    
    
    
    
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
        
        return arrProductPhotos.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! CollectionViewCell
        
        cell.imgProductPhoto.image = arrProductPhotos[indexPath.row]
        cell.imgProductPhoto.layer.cornerRadius = 10
        return cell
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    
    let subjectsArr = [UIImage(named: "bbacu"),UIImage(named: "balaccu"),UIImage(named: "commartscu"),UIImage(named: "isecu"),UIImage(named: "ebacu"),UIImage(named: "jippcu")]
    
    
    let myCarousel:iCarousel = {
        let view = iCarousel()
        view.type = .rotary
        
        return view
    }()
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return subjectsArr.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: view?.frame.origin.y ?? 500 - 1500, width: self.view.frame.size.width/2, height: self.view.frame.size.width/2))
        // view.backgroundColor = .blue
        
        let imageView = UIImageView(frame: view.bounds)
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


class ChildViewController2: UIViewController, IndicatorInfoProvider ,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,iCarouselDataSource,iCarouselDelegate {
    
    func carousel(_ carousel: iCarousel, didSelectItemAt index: Int) {
        self.performSegue(withIdentifier: "fromtu", sender: self)
    }
    
    
    
    
    var arrProductPhotos = [UIImage(named: "ad1"),UIImage(named: "ad2"),UIImage(named: "ad1"),UIImage(named: "ad2")]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        collectionView222.delegate = self
        collectionView222.dataSource = self
        myCarousel.delegate = self
        pageControl.numberOfPages = arrProductPhotos.count
        startTimer()
        collectionView222.reloadData()
        view.addSubview(myCarousel)
        myCarousel.dataSource = self
        myCarousel.frame = CGRect(x: 150, y: 300, width: view.frame.size.width/4, height: 60)
        view.bringSubviewToFront(myCarousel)
        
        view.bringSubviewToFront(pageControl)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "TU")
        
        
    }
    
    
    
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView222: UICollectionView!
    //adsss
    //    @IBOutlet weak var collectionView222: UICollectionView!
    //
    //
    //    @IBOutlet weak var pageControl: UIPageControl!
    
    var timer:Timer?
    var currentCellIndex = 0
    
    
    
    
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
        
        return arrProductPhotos.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! CollectionViewCell
        
        cell.imgProductPhoto.image = arrProductPhotos[indexPath.row]
        cell.imgProductPhoto.layer.cornerRadius = 10
        return cell
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    let subjectsArr = [UIImage(named: "bbatu"),UIImage(named: "betu"),UIImage(named: "lawtu"),UIImage(named: "pbictu"),UIImage(named: "siittu")]
    
    
    let myCarousel:iCarousel = {
        let view = iCarousel()
        view.type = .rotary
        
        return view
    }()
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return subjectsArr.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: view?.frame.origin.y ?? 500 - 1500, width: self.view.frame.size.width/2, height: self.view.frame.size.width/2))
        // view.backgroundColor = .blue
        
        let imageView = UIImageView(frame: view.bounds)
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

class ChildViewController3: UIViewController, IndicatorInfoProvider,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,iCarouselDataSource {
    //icarousel
    //    let subjectsArr = [UIImage(named: "11 sat PHY"),UIImage(named: "11 sat math "),UIImage(named: "11 ielts"),UIImage(named: "11 ged")]
    
    override func viewDidLoad() {
        // myCarousel.centerItemWhenSelected = false
        super.viewDidLoad()
        collectionView222.delegate = self
        collectionView222.dataSource = self
        
        pageControl.numberOfPages = arrProductPhotos.count
        startTimer()
        collectionView222.reloadData()
        view.addSubview(myCarousel)
        myCarousel.dataSource = self
        myCarousel.frame = CGRect(x: 150, y: 300, width: view.frame.size.width/4, height: 60)
        view.bringSubviewToFront(myCarousel)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "MUIC")
    }
    //    @IBOutlet weak var collectionView222: UICollectionView!
    //
    //
    //    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView222: UICollectionView!
    var arrProductPhotos = [UIImage(named: "ad1"),UIImage(named: "ad2"),UIImage(named: "ad1"),UIImage(named: "ad2")]
    
    var timer:Timer?
    var currentCellIndex = 0
    
    
    
    
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
        
        return arrProductPhotos.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! CollectionViewCell
        
        cell.imgProductPhoto.image = arrProductPhotos[indexPath.row]
        cell.imgProductPhoto.layer.cornerRadius = 10
        return cell
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    //carouselllllllllllllllllllll
    let subjectsArr = [UIImage(named: "11 sat PHY"),UIImage(named: "11 sat math "),UIImage(named: "11 ielts"),UIImage(named: "11 ged")]
    
    
    let myCarousel:iCarousel = {
        let view = iCarousel()
        view.type = .rotary
        
        return view
    }()
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return subjectsArr.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: view?.frame.origin.y ?? 500 - 1500, width: self.view.frame.size.width/2, height: self.view.frame.size.width/2))
        let imageView = UIImageView(frame: view.bounds)
        
        view.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.image = subjectsArr[index]
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
    
    //end of carousel
}


class PDF2:UIViewController{
    
    
    
    //@IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.displayPdf()
    }
    
    private func resourceUrl(forFileName fileName: String) -> URL? {
        if let resourceUrl = Bundle.main.url(forResource: fileName,
                                             withExtension: "pdf") {
            return resourceUrl
        }
        
        return nil
    }
    private func createPdfView(withFrame frame: CGRect) -> PDFView {
        let pdfView = PDFView(frame: frame)
        pdfView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        pdfView.autoScales = true
        
        return pdfView
    }
    
    private func displayPdf() {
        let pdfView = self.createPdfView(withFrame: self.view.bounds)
        
        if let pdfDocument = self.createPdfDocument(forFileName: "heaps") {
            self.view.addSubview(pdfView)
            pdfView.document = pdfDocument
        }
    }
    
    private func createPdfDocument(forFileName fileName: String) -> PDFDocument? {
        if let resourceUrl = URL(string: "http://www.ise.eng.chula.ac.th/document/EarlyAdmission/Admission_Criteria_for_Academic_Year_2021.pdf") {
            return PDFDocument(url: resourceUrl)
        }
        
        return nil
        
        
    }
}
extension UIView {
    
    // Using a function since `var image` might conflict with an existing variable
    // (like on `UIImageView`)
    func asImage() -> UIImage {
        if #available(iOS 10.0, *) {
            let renderer = UIGraphicsImageRenderer(bounds: bounds)
            return renderer.image { rendererContext in
                layer.render(in: rendererContext.cgContext)
            }
        } else {
            UIGraphicsBeginImageContext(self.frame.size)
            self.layer.render(in:UIGraphicsGetCurrentContext()!)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return UIImage(cgImage: image!.cgImage!)
        }
    }
}
