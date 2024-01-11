//
//  DetailView.swift
//  Architecture_VIPER
//
//  Created by Mikel Valle on 28/12/23.
//

import Foundation
import UIKit

class DetailView: UIViewController {
    private let presenter: DetailPresentable
    
    init(presenter: DetailPresentable) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
