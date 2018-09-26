//
//  StarWarsApi.swift
//  StarWars
//
//  Created by Cameron Latham on 9/22/18.
//  Copyright © 2018 Cameron Latham. All rights reserved.
//

import Foundation

class StarWarsApi {
    static let sharedInstance = StarWarsApi()
    let url = "http://public.duethealth.com/api/project.json"
    let session = URLSession.shared
    
    func getResults(completion: @escaping ([StarWarsCharacter]) -> Void) {
        guard let url = URL(string: url) else {
            print("Error: cannot create URL")
            return
        }
        let urlRequest = URLRequest(url: url)
        let task = session.dataTask(with: urlRequest,
                                    completionHandler: { (data, response, error) in
                                        
                                        var starWarsCharacters = [StarWarsCharacter]()
                                        
                                        guard let responseData = data else {
                                            print("Error: did not receive data")
                                            return
                                        }
                                        
                                        guard let results = try? JSONDecoder().decode(Results.self, from: responseData) else {
                                            print("Error: Couldn't decode data into results")
                                            return
                                        }
                                        
                                        for character in results.starWarsCharacters {
                                            starWarsCharacters.append(character)
                                        }
                                        
                                        completion(starWarsCharacters)
        })
        task.resume()
    }
}
