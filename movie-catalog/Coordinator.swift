//
//  Coordinator.swift
//  MVVM-C Sample
//
//  Created by William Reinert on 14/11/22.
//

import Foundation
import UIKit

public protocol Coordinator {
    var currentViewController: UIViewController? { get }
    var navigationController: UINavigationController? { get }
    func start()
}
