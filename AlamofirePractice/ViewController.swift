//
//  ViewController.swift
//  AlamofirePractice
//
//  Created by 김동준 on 2021/05/11.
//

import UIKit

class ViewController: UIViewController {

    let airModel = AirModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        airModel.stateDelegate = self
        airModel.gettingAirData()
        
        
    }


}

extension ViewController: AirModelStateDelegate{
    func sendAirList(_ airList: [AirInfo]) {
        print(airList.count)
    }
    
    
}
