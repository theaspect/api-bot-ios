//
//  BaseCollectionController.swift
//  vc
//
//  Created by Anton Skorodumov on 01.06.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import Foundation
import UIKit

class BaseCollectionViewController: BaseViewController {
    
    let navigationBarScrollingDelay: Double = 50.0
    
    // MARK: - private variables
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - view controller methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor.clear
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

    }
    
}
