//
//  DetailPresenter.swift
//  Architecture_VIPER
//
//  Created by Mikel Valle on 28/12/23.
//

import Foundation

class DetailPresenter {
    private let interactor: DetailInteractable
    
    init(interactor: DetailInteractable) {
        self.interactor = interactor
    }
}
