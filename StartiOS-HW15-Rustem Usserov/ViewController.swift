//
//  ViewController.swift
//  StartiOS-HW15-Rustem Usserov
//
//  Created by Rustem on 10.05.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getData(urlRequest: "https://cataas.com/api/cats")
    }
    func getData(urlRequest: String) {
        guard let url = URL(string: urlRequest) else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            if let response = response as? HTTPURLResponse {
                print("Response status code: \(response.statusCode)")

                if response.statusCode == 200 {
                    guard let data = data, let dataAsString = String(data: data, encoding: .utf8) else {
                        print("Data is nil or cannot be decoded")
                        return
                    }
                    print("Data received: \(dataAsString)")
                } else {
                    print("Server responded with status code: \(response.statusCode)")
                }
            } else {
                print("Failed to get HTTP response")
            }
        }.resume()
    }



}

