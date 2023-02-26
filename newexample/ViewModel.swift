//
//  ViewModel.swift
//  newexample
//
//  Created by Jaleel Gilbert on 2/25/23.
//

import Foundation


class ViewModel {
    
    var coinData = Coin(markets: [Market](), next: "")
    
    let delegate: Networking
    
    init() {
        self.delegate = Networking()
    }
    
    
    func getData(response: @escaping (Bool) -> ()) {
  
        delegate.getData { [weak self] result in
            
            switch result {
                
            case .success(let data):
                DispatchQueue.main.async {
                    self?.coinData = data
                    response(true)
                }
                
            case .failure(let error):
                response(false)
                print(error)
                
            }
        }
    }
}
    
