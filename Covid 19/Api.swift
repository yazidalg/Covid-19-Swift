//
//  Api.swift
//  Covid 19
//
//  Created by Yazid Al Ghazali on 12/11/20.
//  Copyright © 2020 Yazid Al Ghazali. All rights reserved.
//

import Foundation
import Alamofire

class ApiCovid: ObservableObject {
    @Published var apiCov = [Country]()
    
    func getData() {
        AF.request("https://api.covid19api.com/summary")
            .responseDecodable(of: Countries.self){(data) in
                guard let dataCov = data.value else {return}
                self.apiCov = dataCov.countries
                print(self.apiCov)
        }
    }
}
