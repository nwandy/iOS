//
//  TemplateTableController.swift
//  WELC Map Test
//
//  Created by Andrea on 01/07/16.
//  Copyright © 2016 SPAM Concept srl. All rights reserved.
//


import UIKit

class TemplateTableController: UITableViewController, SlideMenuDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.barTintColor=UIColor.whiteColor()
        self.navigationController!.navigationBar.tintColor=UIColor.blackColor()
        let BarImage:UIImage! = UIImage(named: "logoRET")
        
        //        self.navigationController!.navigationBar.setBackgroundImage(BarImage, forBarMetrics:.Default)
        let logoView=UIImageView(frame: CGRect(x:0, y:0, width: 200, height: 45))
        logoView.contentMode = .ScaleAspectFit
        logoView.image=BarImage
        self.navigationController!.navigationBar.topItem!.titleView=logoView
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func slideMenuItemSelectedAtIndex(index: Int32) {
        let topViewController : UIViewController = self.navigationController!.topViewController!
        print("View Controller is : \(topViewController) \n", terminator: "")
        switch(index){
        case 0:
            
            
            self.openViewControllerBasedOnIdentifier("Base")
            
            break
        case 1:
            
            
            
            self.openViewControllerBasedOnIdentifier("Tutorial")
            
            break
        case 2:
            print("Play\n", terminator: "")
            
            self.openViewControllerBasedOnIdentifier("ChiSiamo")
            
            break
        case 3:
            print("Play\n", terminator: "")
            
            self.openViewControllerBasedOnIdentifier("Partner")
            
            break
        case 4:
            print("Play\n", terminator: "")
            
            self.openViewControllerBasedOnIdentifier("Contatti")
            
            break
        default:
            print("default\n", terminator: "")
        }
        //        arrayMenuOptions.append(["title":"Start"])
        //        arrayMenuOptions.append(["title":"Tutorial"])
        //        arrayMenuOptions.append(["title":"Chi Siamo"])
        //        arrayMenuOptions.append(["title":"Partner"])
        //        arrayMenuOptions.append(["title":"Contatti"])
    }
    
    func openViewControllerBasedOnIdentifier(strIdentifier:String){
        let destViewController : UIViewController = self.storyboard!.instantiateViewControllerWithIdentifier(strIdentifier)
        
        let topViewController : UIViewController = self.navigationController!.topViewController!
        
        if (topViewController.restorationIdentifier! == destViewController.restorationIdentifier!){
            print("Same VC")
        } else {
            self.navigationController!.pushViewController(destViewController, animated: true)
        }
    }
    
    func addSlideMenuButton(){
        let btnShowMenu = UIButton(type: UIButtonType.System)
        btnShowMenu.setImage(self.defaultMenuImage(), forState: UIControlState.Normal)
        btnShowMenu.frame = CGRectMake(0, 0, 30, 30)
        btnShowMenu.addTarget(self, action: #selector(TemplateTableController.onSlideMenuButtonPressed(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        let customBarItem = UIBarButtonItem(customView: btnShowMenu)
        self.navigationItem.leftBarButtonItem = customBarItem;
    }
    
    func defaultMenuImage() -> UIImage {
        var defaultMenuImage = UIImage()
        
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(30, 22), false, 0.0)
        
        UIColor.blackColor().setFill()
        UIBezierPath(rect: CGRectMake(0, 3, 30, 1)).fill()
        UIBezierPath(rect: CGRectMake(0, 10, 30, 1)).fill()
        UIBezierPath(rect: CGRectMake(0, 17, 30, 1)).fill()
        
        UIColor.whiteColor().setFill()
        UIBezierPath(rect: CGRectMake(0, 4, 30, 1)).fill()
        UIBezierPath(rect: CGRectMake(0, 11,  30, 1)).fill()
        UIBezierPath(rect: CGRectMake(0, 18, 30, 1)).fill()
        
        defaultMenuImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return defaultMenuImage;
    }
    
    func onSlideMenuButtonPressed(sender : UIButton){
        if (sender.tag == 10)
        {
            // To Hide Menu If it already there
            self.slideMenuItemSelectedAtIndex(-1);
            
            sender.tag = 0;
            
            let viewMenuBack : UIView = view.subviews.last!
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                var frameMenu : CGRect = viewMenuBack.frame
                frameMenu.origin.x = -1 * UIScreen.mainScreen().bounds.size.width
                viewMenuBack.frame = frameMenu
                viewMenuBack.layoutIfNeeded()
                viewMenuBack.backgroundColor = UIColor.clearColor()
                }, completion: { (finished) -> Void in
                    viewMenuBack.removeFromSuperview()
            })
            
            return
        }
        
        sender.enabled = false
        sender.tag = 10
        
        let menuVC : MenuViewController = self.storyboard!.instantiateViewControllerWithIdentifier("MenuViewController") as! MenuViewController
        menuVC.btnMenu = sender
        menuVC.delegate = self
        self.view.addSubview(menuVC.view)
        self.addChildViewController(menuVC)
        menuVC.view.layoutIfNeeded()
        
        
        menuVC.view.frame=CGRectMake(0 - UIScreen.mainScreen().bounds.size.width, 0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height);
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            menuVC.view.frame=CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height);
            sender.enabled = true
            }, completion:nil)
    }
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(tableView: UITableView,cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell=self.tableView.dequeueReusableCellWithIdentifier("ImageTableCell", forIndexPath: indexPath ) as! partnerCell
       return cell
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
}
