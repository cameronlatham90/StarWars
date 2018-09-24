//
//  StarWarsApi.swift
//  StarWars
//
//  Created by Cameron Latham on 9/22/18.
//  Copyright © 2018 Cameron Latham. All rights reserved.
//

import Foundation

class StarWarsApi {
    let url = "http://public.duethealth.com/api/project.json"
    //let todoEndpoint: String = "https://jsonplaceholder.typicode.com/todos/1"
    let session = URLSession.shared
    
    func getResults() {
        guard let url = URL(string: url) else {
            print("Error: cannot create URL")
            return
        }
        let urlRequest = URLRequest(url: url)
        let task = session.dataTask(with: urlRequest) { data, response, error in
            
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            
            guard let results = try? JSONDecoder().decode(Results.self, from: responseData) else {
                print("Error: Couldn't decode data into results")
                return
            }
            
            for character in results.starWarsCharacters {
                print(character.skinColor)
            }
        }
        task.resume()
    }
}
