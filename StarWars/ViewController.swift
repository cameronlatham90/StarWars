//
//  ViewController.swift
//  StarWars
//
//  Created by Cameron Latham on 9/22/18.
//  Copyright © 2018 Cameron Latham. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var starWarsCharacters = [StarWarsCharacter]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StarWarsApi.sharedInstance.getResults(completion: populateGalaxy(characters:))
        let screenSize: CGRect = UIScreen.main.bounds
        
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        tableView.frame = CGRectMake(0, 0, screenWidth, screenHeight)
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        self.view.addSubview(tableView)
        
    }
    
    func populateGalaxy(characters: [StarWarsCharacter]){
        starWarsCharacters = characters
    }
    
    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if starWarsCharacters.isEmpty {
            return 0
        } else {
        return starWarsCharacters.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let currentCharacter = starWarsCharacters[indexPath.row]
        
        cell.textLabel?.text = currentCharacter.name
        
        let url = URL(string: currentCharacter.image)!
        cell.imageView?.load(url: url)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}

