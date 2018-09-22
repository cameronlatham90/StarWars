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
            
            do {
                guard let todo = try JSONSerialization.jsonObject(with: responseData, options: [])
                    as? [String: Any] else {
                        print("error trying to convert data to JSON")
                        return
                }
                
                
                // now we have the todo
                // let's just print it to prove we can access it
                print("The todo is: " + todo.description)
                
                // the todo object is a dictionary
                // so we just access the title using the "title" key
                // so check for a title and print it if we have one
                guard let todoTitle = todo["results"] as? String else {
                    print("Could not get todo title from JSON")
                    return
                }
                print("The title is: " + todoTitle)
            } catch  {
                print("error trying to convert data to JSON")
                return
            }        }
        task.resume()
    }
}
