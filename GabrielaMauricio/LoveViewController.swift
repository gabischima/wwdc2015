//
//  LoveViewController.swift
//  GabrielaMauricio
//
//  Created by Gabriela Schirmer Mauricio on 4/21/15.
//  Copyright (c) 2015 Gabriela Schirmer Mauricio. All rights reserved.
//

import Foundation
import UIKit


class LoveViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource { // class for projects
    
    @IBOutlet weak var engravingCollection: UICollectionView!
    @IBOutlet weak var myScroll: UIScrollView!
    @IBOutlet weak var drawCollection: UICollectionView!
    @IBOutlet weak var bookbindingCollection: UICollectionView!
    @IBOutlet weak var circusCollection: UICollectionView!
    
    var myImages1 = [UIImage?()]
    var myImages2 = [UIImage?()]
    var myImages3 = [UIImage?()]
    var myImages4 = [UIImage?()]

    var imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createImagesArray()
        imageView.hidden = true
    }
    
    func createImagesArray(){
        myImages1 = [UIImage(named: "draw0.jpg"), UIImage(named: "draw1.jpg"), UIImage(named: "draw2.jpg"), UIImage(named: "draw3.jpg"), UIImage(named: "draw4.jpg"), UIImage(named: "draw5.jpg"), UIImage(named: "draw6.jpg"), UIImage(named: "draw7.jpg"), UIImage(named: "draw8.jpg"), UIImage(named: "draw9.jpg"), UIImage(named: "draw10.jpg"), UIImage(named: "draw11.jpg"), UIImage(named: "draw12.jpg")]

        myImages2 = [UIImage(named: "gravura1.jpg"), UIImage(named: "gravura2.jpg"), UIImage(named: "gravura3.jpg"), UIImage(named: "gravura4.jpg"), UIImage(named: "gravura5.jpg")]
        
        myImages3 = [UIImage(named: "bookbinding1.jpg"), UIImage(named: "bookbinding2.jpg"), UIImage(named: "bookbinding3.jpg"), UIImage(named: "bookbinding4.jpg"), UIImage(named: "bookbinding5.jpg")]
        
        myImages4 = [UIImage(named: "circus1.jpg"), UIImage(named: "circus2.jpg"), UIImage(named: "circus4.jpg"), UIImage(named: "circus3.jpg")]

    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("0", forIndexPath: indexPath) as! MyCell
        
        if (collectionView == drawCollection){
            cell.myImageViews.image = myImages1[indexPath.row]
        } else if (collectionView == engravingCollection){
            cell.myImageViews.image = myImages2[indexPath.row]
        } else if (collectionView == bookbindingCollection){
            cell.myImageViews.image = myImages3[indexPath.row]
        } else if (collectionView == circusCollection){
            cell.myImageViews.image = myImages4[indexPath.row]
        }
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == drawCollection){
            return myImages1.count
        } else if (collectionView == engravingCollection) {
            return myImages2.count
        } else if (collectionView == bookbindingCollection){
            return myImages3.count
        } else {
            return myImages4.count
        }
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        imageView.hidden = false
        imageView.frame = CGRectMake(0, 0, myScroll.frame.size.width, myScroll.frame.size.height)
        myScroll.addSubview(imageView)
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        imageView.backgroundColor = UIColor(white: 1, alpha: 1)
        
        if (collectionView == drawCollection){
            imageView.image = myImages1[indexPath.row]
        } else if (collectionView == engravingCollection){
            imageView.image = myImages2[indexPath.row]
        } else if (collectionView == bookbindingCollection){
            imageView.image = myImages3[indexPath.row]
        } else if (collectionView == circusCollection){
            imageView.image = myImages4[indexPath.row]
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
