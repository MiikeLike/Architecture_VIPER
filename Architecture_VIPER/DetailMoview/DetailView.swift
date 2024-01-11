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
    
    let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode  = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let movieName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 32, weight: .bold, width: .condensed)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()   
    
    let movieDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 22, weight: .bold, width: .standard)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(presenter: DetailPresentable) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
    }
    func setupView() {
        view.addSubview(movieImageView)
        view.addSubview(movieName)
        view.addSubview(movieDescription)
    }
}
