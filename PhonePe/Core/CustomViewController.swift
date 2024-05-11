//
//  CustomViewController.swift
//  PhonePe
//
//  Created by Ravi Ranjan on 11/05/24.
//

import Foundation
import UIKit
class CustomViewController<T: ViewModelProtocol>: UIViewController {

    
    // Mandatory view model of type ViewModelProtocol
    let viewModel: T

    // MARK: - Initialization
    
    init(viewModel: T) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
