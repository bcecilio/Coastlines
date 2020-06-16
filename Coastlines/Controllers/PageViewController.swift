//
//  PageViewController.swift
//  Coastlines
//
//  Created by Cameron Rivera on 6/15/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
    
    private let onboardingControllers: [UIViewController] = [OnboardingController(SecondOnboardingView()),OnboardingController(ThirdOnboardingView()), OnboardingController(FourthOnboardingView()), OnboardingController(FifthOnboardingView())]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        stylePageControl()
    }
    
    private func setUp(){
        self.dataSource = self
        view.backgroundColor = PaletteColour.lightBlue.colour
        
        if let firstVC = onboardingControllers.first {
            self.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    /// Configures the style of the page control. 
    private func stylePageControl() {
        let pageControl = UIPageControl.appearance(whenContainedInInstancesOf: [type(of: self)])
        
        pageControl.currentPageIndicatorTintColor = PaletteColour.offWhite.colour
        pageControl.backgroundColor = PaletteColour.lightBlue.colour
        pageControl.isUserInteractionEnabled = false
    }
}

extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentVCIndex = onboardingControllers.firstIndex(of: viewController), currentVCIndex - 1 >= 0, onboardingControllers.count > currentVCIndex - 1 else {
            return nil
        }
        
        return onboardingControllers[currentVCIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentVCIndex = onboardingControllers.firstIndex(of: viewController), currentVCIndex + 1 < onboardingControllers.count else{
            return nil
        }
        
        return onboardingControllers[currentVCIndex + 1]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return onboardingControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
