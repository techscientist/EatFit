//
//  UIPageViewController+YALPageController.swift
//  EatFit
//
//  Created by Dmitriy Demchenko on 7/12/16.
//  Copyright © 2016 aleksey chernish. All rights reserved.
//

import UIKit

extension UIPageViewController {
    
    var yal_controller: YALPageController {
        var controller = objc_getAssociatedObject(self, &YALPageController.YALPageControllerAssociatedObjectHandle) as? YALPageController
        
        if controller != nil  {
            return controller!
        }
        
        controller = YALPageController()
        objc_setAssociatedObject(
            self,
            &YALPageController.YALPageControllerAssociatedObjectHandle,
            controller,
            .OBJC_ASSOCIATION_RETAIN_NONATOMIC
        )
        
        self.delegate = controller
        self.dataSource = controller
        controller!.pageViewController = self
        return controller!
    }
    
    func yal_setViewControllers(viewControllers: [UIViewController]) {
        yal_controller.setupViewControllers(viewControllers)
    }
    
    func yal_viewControllers() -> [UIViewController] {
        return yal_controller.viewControllers
    }

    func yal_showViewController(viewController: UIViewController) {
        yal_controller.showViewController(viewController, animated: true)
    }
    
    func yal_showViewController(viewController: UIViewController, animated: Bool) {
        yal_controller.showViewController(viewController, animated: animated)
    }
    
    func yal_showPage(page: UInt, animated: Bool) {
        yal_controller.showPage(page, animated: animated)
    }
    
    func yal_showPage(page: UInt) {
        self.yal_showPage(page, animated: true)
    }
    
    func yal_setDidFinishTransition(didFinishTransition: YALPageControllerTransitionHook) {
        yal_controller.didFinishTransition = didFinishTransition
    }
    
    func yal_setPagingEnabled(enabled: Bool) {
        yal_controller.pagingEnabled = enabled
    }
    
}