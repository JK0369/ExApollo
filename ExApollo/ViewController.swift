//
//  ViewController.swift
//  ExApollo
//
//  Created by Jake.K on 2022/02/28.
//

import UIKit
import Apollo

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // singletown으로 사용하지 않으면 sessionInvalidated에러 발생
    let apollo = ApolloClient(url: URL(string: "https://apollo-fullstack-tutorial.herokuapp.com/graphql")!)
    apollo.fetch(query: MyQueryQuery()) { result in
      switch result {
      case .success(let data):
        print(data.data?.launches.cursor)
      case .failure(let error):
        print(error) // sessionInvalidated
      }
    }
    
    Network.shared.apollo.fetch(query: MyQueryQuery()) { result in
      switch result {
      case .success(let data):
        print(data.data?.launches.cursor)
      case .failure(let error):
        print(error)
      }
    }
  }
}
 
class Network {
  static let shared = Network()

  private(set) lazy var apollo = ApolloClient(url: URL(string: "https://apollo-fullstack-tutorial.herokuapp.com/graphql")!)
}
