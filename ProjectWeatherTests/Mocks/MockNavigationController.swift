//
//  MockNavigationController.swift
//  Clima
//
//  Created by Yash Koyyana on 1/27/20.
//  Copyright © 2020 YK. All rights reserved.
//

import Foundation
import UIKit

class MockNavigationController: UINavigationController {

  var pushedViewController: UIViewController?

      override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {

        pushedViewController = viewControllerToPresent

        super.present(viewControllerToPresent, animated: flag, completion: completion)

    }

}
