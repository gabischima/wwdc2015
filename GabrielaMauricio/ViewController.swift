//
//  ViewController.swift
//  GabrielaMauricio
//
//  Created by Gabriela Schirmer Mauricio on 4/15/15.
//  Copyright (c) 2015 Gabriela Schirmer Mauricio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var containerOne: UIView!
    @IBOutlet weak var containerTwo: UIView!
    @IBOutlet weak var containerThree: UIView!
    @IBOutlet weak var containerFour: UIView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var myViewContainer: UIView!
    
    var scrollHead = UIScrollView()
    var scrollFace = UIScrollView()
    var scrollBody = UIScrollView()
    var scrollFeet = UIScrollView()
        
    var imageView = [UIImageView()]
    var imageView2 = [UIImageView()]
    var imageView3 = [UIImageView()]
    var imageView4 = [UIImageView()]

    var blackScreen = UIView()
    
    var tapGesture = UITapGestureRecognizer()
    
    let firstLaunch = NSUserDefaults.standardUserDefaults().boolForKey("FirstLaunch")
    
    let viewControllerId = ["MeViewController", "ProfessionalViewController", "ProjectViewController", "LoveViewController"]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        myViewContainer.hidden = true
        
        createTutorial()
        checkIfFirstTime()
        creatScrollViews()
        createArrayImageView()
        
        for index in 0..<imageView.count {
            
            scrollHead.pagingEnabled = true
            
            imageView[index].frame.origin.x = view.frame.size.width * CGFloat(index)
            imageView[index].frame.origin.y = 0
            imageView[index].frame.size.width = view.frame.size.width
            imageView[index].frame.size.height = scrollHead.frame.size.height
            imageView[index].contentMode = UIViewContentMode.ScaleAspectFill
            
            scrollHead.addSubview(imageView[index])
            
        }

        for index in 0..<imageView2.count {
            
            scrollFace.pagingEnabled = true
            
            imageView2[index].frame.origin.x = view.frame.size.width * CGFloat(index)
            imageView2[index].frame.origin.y = 0
            imageView2[index].frame.size.width = view.frame.size.width
            imageView2[index].frame.size.height = scrollFace.frame.size.height
            imageView2[index].contentMode = UIViewContentMode.ScaleAspectFill
            
            scrollFace.addSubview(imageView2[index])
            
        }
        
        for index in 0..<imageView3.count {
            
            scrollBody.pagingEnabled = true
            
            imageView3[index].frame.origin.x = view.frame.size.width * CGFloat(index)
            imageView3[index].frame.origin.y =  0
            imageView3[index].frame.size.width = view.frame.size.width
            imageView3[index].frame.size.height = scrollBody.frame.size.height
            imageView3[index].contentMode = UIViewContentMode.ScaleAspectFill
            
            scrollBody.addSubview(imageView3[index])
            
        }
        
        for index in 0..<imageView4.count {
            
            scrollFeet.pagingEnabled = true
            
            imageView4[index].frame.origin.x = view.frame.size.width * CGFloat(index)
            imageView4[index].frame.origin.y = 0
            imageView4[index].frame.size.width = view.frame.size.width
            imageView4[index].frame.size.height = scrollFeet.frame.size.height
            imageView4[index].contentMode = UIViewContentMode.ScaleAspectFill
            
            scrollFeet.addSubview(imageView4[index])
        }

        scrollHead.contentSize = CGSizeMake(view.frame.size.width * CGFloat(imageView.count), scrollHead.frame.size.height)
        scrollFace.contentSize = CGSizeMake(view.frame.size.width * CGFloat(imageView2.count), scrollFace.frame.size.height)
        scrollBody.contentSize = CGSizeMake(view.frame.size.width * CGFloat(imageView3.count), scrollBody.frame.size.height)
        scrollFeet.contentSize = CGSizeMake(view.frame.size.width * CGFloat(imageView4.count), scrollFeet.frame.size.height)
        
    }
    
    @IBAction func tutorialAction(sender: UIButton) {
        blackScreen.hidden = false
    }
    
    func checkIfFirstTime(){
        
        tapGesture.addTarget(self, action: "tapAction")

        if firstLaunch  {
            print("Not first launch.")
            blackScreen.hidden = true
        }
        else {
            print("First launch, setting NSUserDefault.")
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "FirstLaunch")
            blackScreen.hidden = false
        }
    }
    
    func createTutorial(){
        var tutorial1View = UIImageView(image: UIImage(named: "tutorial1"))
        tutorial1View.frame.size.width = view.frame.size.width
        tutorial1View.frame.size.height = tutorial1View.frame.size.width / 3.2
        tutorial1View.frame.origin.y = (view.frame.size.height - view.frame.size.width)/2
        
        var tutorial2View = UIImageView(image: UIImage(named: "tutorial2"))
        tutorial2View.frame.size.width = view.frame.size.width
        tutorial2View.frame.size.height = tutorial2View.frame.size.width / 3.2
        tutorial2View.frame.origin.y = view.frame.size.height - tutorial2View.frame.size.height
        
        blackScreen.frame = view.frame
        blackScreen.backgroundColor = UIColor(white: 0, alpha: 0.5)
        view.addSubview(blackScreen)
        blackScreen.addSubview(tutorial1View)
        blackScreen.addSubview(tutorial2View)
        blackScreen.addGestureRecognizer(tapGesture)
        blackScreen.userInteractionEnabled = true
    }
    
    func tapAction(){
        blackScreen.hidden = true
        print("tapped")
    }
    
    func createArrayImageView(){
        imageView = [UIImageView(image: UIImage(named: "zero1.png")), UIImageView(image: UIImage(named: "project1.png")), UIImageView(image: UIImage(named: "me1.png")), UIImageView(image: UIImage(named: "love1.png")), UIImageView(image: UIImage(named: "unicorn1.png")), UIImageView(image: UIImage(named: "deer1.png")), UIImageView(image: UIImage(named: "tree1.png")), UIImageView(image: UIImage(named: "rawr1.png")), UIImageView(image: UIImage(named: "professional1.png"))]
        
        imageView2 = [UIImageView(image: UIImage(named: "zero2.png")), UIImageView(image: UIImage(named: "me2.png")), UIImageView(image: UIImage(named: "rawr2.png")), UIImageView(image: UIImage(named: "deer2.png")), UIImageView(image: UIImage(named: "project2.png")), UIImageView(image: UIImage(named: "tree2.png")), UIImageView(image: UIImage(named: "unicorn2.png")), UIImageView(image: UIImage(named: "love2.png"))]
        
        imageView3 = [UIImageView(image: UIImage(named: "zero3.png")), UIImageView(image: UIImage(named: "professional3.png")), UIImageView(image: UIImage(named: "project3.png")), UIImageView(image: UIImage(named: "me3.png")), UIImageView(image: UIImage(named: "deer3.png")), UIImageView(image: UIImage(named: "tree3.png")), UIImageView(image: UIImage(named: "rawr3.png")), UIImageView(image: UIImage(named: "unicorn3.png")), UIImageView(image: UIImage(named: "love3.png"))]
        
        imageView4 = [UIImageView(image: UIImage(named: "zero4.png")), UIImageView(image: UIImage(named: "me4.png")), UIImageView(image: UIImage(named: "love4.png")), UIImageView(image: UIImage(named: "rawr4.png")), UIImageView(image: UIImage(named: "unicorn4.png")), UIImageView(image: UIImage(named: "tree4.png")), UIImageView(image: UIImage(named: "project4.png"))]
        
    }
    
    func creatScrollViews(){
        
        // width / scale = height
        
        scrollFace.frame.size.width = view.frame.size.width
        scrollFace.frame.size.height = scrollFace.frame.size.width/1.4159292035
        scrollFace.frame.origin.x = 0
        scrollFace.frame.origin.y = 0
        
        myView.addSubview(scrollFace)
        
        scrollBody.frame.size.width = view.frame.size.width
        scrollBody.frame.size.height = scrollBody.frame.size.width/1.9875776398
        scrollBody.frame.origin.x = 0
        scrollBody.frame.origin.y = view.frame.size.width - scrollBody.frame.size.height
        
        myView.addSubview(scrollBody)
        
        scrollFeet.frame.size.width = view.frame.size.width
        scrollFeet.frame.size.height = scrollFeet.frame.size.width/8
        scrollFeet.frame.origin.x = 0
        scrollFeet.frame.origin.y = view.frame.size.width - scrollFeet.frame.size.height
        
        myView.addSubview(scrollFeet)
        
        scrollHead.frame.size.width = view.frame.size.width
        scrollHead.frame.size.height = scrollHead.frame.size.width/3.6781609195
        scrollHead.frame.origin.x = 0
        scrollHead.frame.origin.y = 0
        
        myView.addSubview(scrollHead)
        
        scrollHead.showsHorizontalScrollIndicator = false
        scrollFace.showsHorizontalScrollIndicator = false
        scrollBody.showsHorizontalScrollIndicator = false
        scrollFeet.showsHorizontalScrollIndicator = false
        
    }

    @IBAction func meAction(sender: AnyObject) {
        
        myViewContainer.hidden = true
        var myHead = CGPointMake(view.frame.size.width * 2, 0)
        scrollHead.setContentOffset(myHead, animated: true)
        
        var myFace = CGPointMake(view.frame.size.width * 1, 0)
        scrollFace.setContentOffset(myFace, animated: true)
        
        var myBody = CGPointMake(view.frame.size.width * 3, 0)
        scrollBody.setContentOffset(myBody, animated: true)
        
        var myFeet = CGPointMake(view.frame.size.width * 1, 0)
        scrollFeet.setContentOffset(myFeet, animated: true)

        var timer = NSTimer.scheduledTimerWithTimeInterval(0.7, target: self, selector: Selector("meVisible"), userInfo: nil, repeats: false)
    }
    
    func meVisible(){
        myViewContainer.hidden = false
        containerOne.hidden = false
        containerTwo.hidden = true
        containerThree.hidden = true
        containerFour.hidden = true
    }
    
    @IBAction func professionalAction(sender: AnyObject) {
        
        myViewContainer.hidden = true

        var professionalHead = CGPointMake(view.frame.size.width * 8, 0)
        scrollHead.setContentOffset(professionalHead, animated: true)
        
        var professionalFace = CGPointMake(view.frame.size.width * 4, 0)
        scrollFace.setContentOffset(professionalFace, animated: true)
        
        var professionalBody = CGPointMake(view.frame.size.width * 1, 0)
        scrollBody.setContentOffset(professionalBody, animated: true)
        
        var professionalFeet = CGPointMake(view.frame.size.width * 1, 0)
        scrollFeet.setContentOffset(professionalFeet, animated: true)
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.7, target: self, selector: Selector("professionalVisible"), userInfo: nil, repeats: false)

    }
    
    func professionalVisible(){
        myViewContainer.hidden = false
        containerOne.hidden = true
        containerTwo.hidden = false
        containerThree.hidden = true
        containerFour.hidden = true
    }
    
    @IBAction func projectAction(sender: AnyObject) {
        
        myViewContainer.hidden = true
        var projectHead = CGPointMake(view.frame.size.width * 1, 0)
        scrollHead.setContentOffset(projectHead, animated: true)
        
        var prjectFace = CGPointMake(view.frame.size.width * 4, 0)
        scrollFace.setContentOffset(prjectFace, animated: true)
        
        var projectBody = CGPointMake(view.frame.size.width * 2, 0)
        scrollBody.setContentOffset(projectBody, animated: true)
        
        var projectFeet = CGPointMake(view.frame.size.width * 6, 0)
        scrollFeet.setContentOffset(projectFeet, animated: true)
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.7, target: self, selector: Selector("projectVisible"), userInfo: nil, repeats: false)
        
    }
    
    func projectVisible(){
        containerOne.hidden = true
        containerTwo.hidden = true
        containerThree.hidden = false
        containerFour.hidden = true
        myViewContainer.hidden = false

    }
    
    @IBAction func loveAction(sender: AnyObject) {
        
        myViewContainer.hidden = true
        var projectHead = CGPointMake(view.frame.size.width * 3, 0)
        scrollHead.setContentOffset(projectHead, animated: true)
        
        var prjectFace = CGPointMake(view.frame.size.width * 7, 0)
        scrollFace.setContentOffset(prjectFace, animated: true)
        
        var projectBody = CGPointMake(view.frame.size.width * 8, 0)
        scrollBody.setContentOffset(projectBody, animated: true)
        
        var projectFeet = CGPointMake(view.frame.size.width * 2, 0)
        scrollFeet.setContentOffset(projectFeet, animated: true)
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.7, target: self, selector: Selector("loveVisible"), userInfo: nil, repeats: false) 
    }
    
    func loveVisible(){
        containerOne.hidden = true
        containerTwo.hidden = true
        containerThree.hidden = true
        containerFour.hidden = false
        myViewContainer.hidden = false
        
    }
    
    @IBAction func closeAbs(sender: AnyObject) {
        print("fechou")
        myViewContainer.hidden = true
    }
    
    @IBAction func saveAction(sender: AnyObject) {
        
//        var rect = CGRectMake(0, (view.frame.size.height - view.frame.size.width)/2, view.frame.size.width, view.frame.size.width)
        
        let size = CGSizeMake(view.frame.size.width, view.frame.size.width)
        
        UIGraphicsBeginImageContext(size)
        
        myView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        
        let final:UIImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        UIImageWriteToSavedPhotosAlbum(final, nil, nil, nil)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

