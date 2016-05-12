//
//  ProjectViewController.swift
//  GabrielaMauricio
//
//  Created by Gabriela Schirmer Mauricio on 4/21/15.
//  Copyright (c) 2015 Gabriela Schirmer Mauricio. All rights reserved.
//

import Foundation
import UIKit

class ProjectViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource { // class for projects
    
    @IBOutlet weak var myScroll: UIScrollView!
    @IBOutlet weak var myCollection1: UICollectionView!
    @IBOutlet weak var myCollection2: UICollectionView!
    @IBOutlet weak var myCollection3: UICollectionView!
    
    var myImages1 = [UIImage?()]
    var myImages2 = [UIImage?()]
    var myImages3 = [UIImage?()]
    
    var imageView = UIImageView()

    var arrayURLwww = [String]()
    var arrayURLApp = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        createImagesArray()
        arrayURLApp = ["fb://profile/1397675650535035", "instagram://user?username=ennecoisa"]

        arrayURLwww = ["https://m.facebook.com/ennecoisa?_rdr", "https://instagram.com/ennecoisa/"]
    }
    
    func createImagesArray(){
        myImages1 = [UIImage(named: "blank.jpg"), UIImage(named: "aliceiw.jpg"), UIImage(named: "ballon.jpg"), UIImage(named: "clouds.jpg"), UIImage(named: "lala.jpg"), UIImage(named: "malala.jpg"), UIImage(named: "orange.jpg"), UIImage(named: "splash.jpg"), UIImage(named: "spock.jpg"), UIImage(named: "tree.jpg")]
        myImages2 = [UIImage(named: "photo1.jpg"), UIImage(named: "photo2.jpg"), UIImage(named: "photo3.jpg"), UIImage(named: "photo4.jpg"), UIImage(named: "photo5.jpg"),UIImage(named: "photo6.jpg"), UIImage(named: "photo7.jpg"), UIImage(named: "photo8.jpg"), UIImage(named: "photo9.jpg")]
        myImages3 = [UIImage(named: "linePic1.jpg"), UIImage(named: "linePic2.jpg"), UIImage(named: "linePic3.jpg")]
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("0", forIndexPath: indexPath) as! MyCell
        
        if (collectionView == myCollection1){
            cell.myImageViews.image = myImages1[indexPath.row]
        }else if (collectionView == myCollection2){
            cell.myImageViews.image = myImages2[indexPath.row]
        } else if (collectionView == myCollection3){
            cell.myImageViews.image = myImages3[indexPath.row]
        }
        return cell
    }
    
    @IBAction func openLink(sender: UIButton) {
        if(UIApplication.sharedApplication().canOpenURL(NSURL(string: arrayURLApp[sender.tag])!)){
            UIApplication.sharedApplication().openURL(NSURL(string: arrayURLApp[sender.tag])!)
        } else {
            UIApplication.sharedApplication().openURL(NSURL(string: arrayURLwww[sender.tag])!)
        }
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == myCollection1){
            return myImages1.count
        } else if (collectionView == myCollection2){
            return myImages2.count
        } else{
            return myImages3.count

        }
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        imageView.hidden = false
        imageView.frame = CGRectMake(0, 0, myScroll.frame.size.width, myScroll.frame.size.height)
        myScroll.addSubview(imageView)
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        imageView.backgroundColor = UIColor(white: 1, alpha: 1)

        if (collectionView == myCollection1){
            imageView.image = myImages1[indexPath.row]
        }else if (collectionView == myCollection2){
            imageView.image = myImages2[indexPath.row]
        } else if (collectionView == myCollection3){
            imageView.image = myImages3[indexPath.row]
        }
        
        var tap = UITapGestureRecognizer()
        tap.addTarget(self, action: "tapAction")
        imageView.addGestureRecognizer(tap)
        imageView.userInteractionEnabled = true
    }
    
    func tapAction(){
        imageView.hidden = true
        print("tapped")
    }
    
}
