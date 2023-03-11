//
//  APIService.swift
//  sesi2-negara
//
//  Created by Dony Prastiya on 04/03/23.
//

import Foundation
import UIKit
import Alamofire

final class APIService{
    static let shared: APIService = APIService()
    private init(){}
    
    let BASE_URL = "https://restcountries.com/v3.1/all"
    
    lazy var session : Session = {
        let config = URLSessionConfiguration.af.default
        config.timeoutIntervalForRequest = 30
//        let logger = NetworkLogger()
//        return Session(configuration: config, eventMonitors: [logger])
        return Session(configuration: config)
    }()

    func getAllCountries(completion: @escaping ([FlagResponse]) -> Void){
        
        let url = BASE_URL
        session.request(url, method: .get)
            .validate()
            .responseDecodable(of: [FlagResponse].self){
                response in
                switch response.result{
                case .success(let flagResponse):
                    completion(flagResponse)
                case .failure(let error):
                    print(error.localizedDescription)
                    completion([])
                }
            }
    }
}
