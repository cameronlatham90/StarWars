//
//  UIImageView+StarWars.swift
//  StarWars
//
//  Created by Cameron Latham on 9/25/18.
//  Copyright © 2018 Cameron Latham. All rights reserved.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
