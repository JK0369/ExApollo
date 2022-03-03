//
//  TokenManager.swift
//  ExApollo
//
//  Created by Jake.K on 2022/03/03.
//

import Foundation

class TokenManager {
  enum RenewError: Error {
    case unknown
  }
  
  static let shared = TokenManager()
  
  var token: Token? = Token()
  
  func renewToken(completion: @escaping (Result<Token, RenewError>) -> Void) {
    completion(.success(Token()))
  }
  
  private init() {}
}

struct Token {
  let value = "test-token"
  var isExpired: Bool { Bool.random() }
}
