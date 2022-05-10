//
//  STPUINavigationControllerExtension.swift
//  NoraGO
//
//  Created by Valery_Ihnatsyeu on 13.04.22.
//

import SwiftUI

//MARK: - STPUINavigationControllerExtension

extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
