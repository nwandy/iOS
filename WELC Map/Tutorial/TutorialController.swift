//
//  TutorialController.swift
//  WELC Map Test
//
//  Created by Andrea on 30/06/16.
//  Copyright © 2016 SPAM Concept srl. All rights reserved.
//

import UIKit

class TutorialController: UIViewController, UIPageViewControllerDataSource  {
    
    // MARK: - Variables
    private var pageViewController: UIPageViewController?
    
    // Initialize it right away here
    private let contentImages = ["tutorial_1",
                                 "tutorial_2",
                                 "tutorial_3",
                                 "tutorial_4",
                                 "tutorial_5",
                                 "tutorial_6",
                                 "tutorial_7",
                                 "tutorial_8",
                                 "tutorial_9",
                                 "tutorial_10",
                                 "tutorial_11",
                                 "tutorial_12",
                                 "tutorial_13"
    ]
    private var eseguito=false;
    var TutFatto:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.hidden=true

        launchTutorial()
    }
    
    private func launchTutorial()
    {
        createPageViewController()
        setupPageControl()
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private func readFlag()->Bool
    {
        let defaults = NSUserDefaults.standardUserDefaults()
        if (defaults.boolForKey("tutorial")) {
            return true
        }
        else{
            return false
        }
    }
    private func saveFlag()
    {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setValue(eseguito, forKey: "tutorial")
        defaults.synchronize()
    }
    private func createPageViewController() {
        
        let pageController = self.storyboard!.instantiateViewControllerWithIdentifier("PageController") as! UIPageViewController
        pageController.dataSource = self
        
        if contentImages.count > 0 {
            let firstController = getItemController(0)!
            let startingViewControllers = [firstController]
            pageController.setViewControllers(startingViewControllers, direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
        }
        
        pageViewController = pageController
        addChildViewController(pageViewController!)
        self.view.addSubview(pageViewController!.view)
        pageViewController!.didMoveToParentViewController(self)
    }
    
    private func setupPageControl() {
        let appearance = UIPageControl.appearance()
        appearance.pageIndicatorTintColor = UIColor.grayColor()
        appearance.currentPageIndicatorTintColor = UIColor.whiteColor()
        appearance.backgroundColor = UIColor.darkGrayColor()
    }
    
    // MARK: - UIPageViewControllerDataSource
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        let itemController = viewController as! PageItemController
        
        if itemController.itemIndex > 0 {
            return getItemController(itemController.itemIndex-1)
        }
        
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        let itemController = viewController as! PageItemController
        
        if itemController.itemIndex+1 < contentImages.count {
            return getItemController(itemController.itemIndex+1)
        }
        
        return nil
    }
    
    private func getItemController(itemIndex: Int) -> PageItemController? {
        
        if itemIndex < contentImages.count {
            let pageItemController = self.storyboard!.instantiateViewControllerWithIdentifier("ItemController") as! PageItemController
            pageItemController.itemIndex = itemIndex
            pageItemController.imageName = contentImages[itemIndex]
            return pageItemController
        }
        
        return nil
    }
    
    // MARK: - Page Indicator
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return contentImages.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
}


