//
//  ViewController.swift
//  StarWars
//
//  Created by Cameron Latham on 9/22/18.
//  Copyright © 2018 Cameron Latham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let starWarsApi = StarWarsApi()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        starWarsApi.getResults()
    }

}

