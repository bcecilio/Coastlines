//
//  PageController.swift
//  Coastlines
//
//  Created by Cameron Rivera on 6/17/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class PageController: UIPageViewController {

    private let onboardingControllers: [UIViewController] = [OnboardingController(SecondOnboardingView()), OnboardingController(ThirdOnboardingView()), OnboardingController(FourthOnboardingView()), OnboardingController(FifthOnboardingView())]
    
    init(){
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        stylePageControl()
    }
    
    private func setUp(){
        dataSource = self
        view.backgroundColor = PaletteColour.darkBlue.colour
        
        if let first = onboardingControllers.first {
            setViewControllers([first], direction: .forward, animated: true)
        }
        
    }
    
    private func stylePageControl(){
        let pageControl = UIPageControl.appearance(whenContainedInInstancesOf: [type(of: self)])
        
        pageControl.backgroundColor = PaletteColour.darkBlue.colour
        pageControl.isUserInteractionEnabled = false
    }

}

extension PageController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let controllerIndex = onboardingControllers.firstIndex(of: viewController), controllerIndex - 1 >= 0 else {
            return nil
        }
        
        return onboardingControllers[controllerIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let controllerIndex = onboardingControllers.firstIndex(of: viewController), controllerIndex + 1 < onboardingControllers.count else {
            return nil
        }
        
        return onboardingControllers[controllerIndex + 1]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return onboardingControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
