//
//  ListOfMoviesView.swift
//  Architecture_VIPER
//
//  Created by Mikel Valle on 21/12/23.
//

import Foundation
import UIKit

class ListOfMoviesView: UIViewController {
    private var moviesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(MovieCellView.self, forCellReuseIdentifier: "MovieCellView")
        return tableView
    }()
    
    var presenter: ListOfMoviesPresenter?

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        setupTableView()
        presenter?.onViewAppear()
    }
    private func setupTableView() {
        view.addSubview(moviesTableView)
        
        NSLayoutConstraint.activate([
            moviesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            moviesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            moviesTableView.topAnchor.constraint(equalTo: view.topAnchor),
            moviesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        moviesTableView.dataSource = self
    }
}
extension ListOfMoviesView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.viewModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCellView", for: indexPath) as! MovieCellView
        
        // Verificamos que el presenter y el índice sean válidos
        if let presenter = presenter, indexPath.row < presenter.viewModels.count {
            let model = presenter.viewModels[indexPath.row]
            cell.configure(model: model)
        } else {
            print("Error: Presenter is nil or indexPath is out of range.")
            
            print("Advertencia: No se pudo acceder al modelo en indexPath: \(indexPath.row).")
            
            assertionFailure("Error crítico: Se produjo un error inesperado en cellForRowAt.")
        }
        
        return cell
    }

    
    
}

extension ListOfMoviesView: ListOfMoviesUI {
    func update(movies: [MovieViewModel]) {
        print("Datos Recibidos \(movies)")
        DispatchQueue.main.async {
            self.moviesTableView.reloadData()
        }
    }
}
