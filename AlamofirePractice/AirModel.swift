//
//  AirModel.swift
//  AlamofirePractice
//
//  Created by 김동준 on 2021/05/12.
//

import Foundation
import Alamofire

class AirModel{
    
    let baseURL: String =  "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty?ServiceKey=1JUx53nAuRK7R7oDRkF%2BQ3B8Aonj3YXBgV0nIQmDoNBl8yb7M4B4IprCD5mRpOuaL%2Fv6j8mgCLeXiaG08tYWaw%3D%3D"
    
    weak var stateDelegate: AirModelStateDelegate?
    
    func gettingAirData(){
        
        let alamo = AF.request(baseURL, method: .get, parameters: ["ver":"1.3","numOfRows":"50","pageNo":"1","sidoName":"서울", "_returnType":"json"],encoding: URLEncoding.default, headers: nil).validate(statusCode: 200..<300)
        
        alamo.responseJSON() { [weak self] response in
            
            switch response.result{

            case .success(let val):
                let decoder = JSONDecoder()
                
                let info = try? decoder.decode(AirEncode.self, from: response.data!)
                
                self?.stateDelegate?.sendAirList(info!.list)
                
            case .failure(let error):
                print("error: \(String(describing: error.errorDescription))")
            }
        }
    }
    
    
}

protocol AirModelStateDelegate: class{
    func sendAirList(_ airList: [AirInfo])
}
