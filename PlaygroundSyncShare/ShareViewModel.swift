//
//  ShareViewModel.swift
//  PlaygroundSync
//
//  Created by A. Zheng (github.com/aheze) on 1/8/22.
//  Copyright © 2022 A. Zheng. All rights reserved.
//
    

import SwiftUI
import OctoKit

class ShareViewModel: ObservableObject {
    var token: String
    var config: TokenConfiguration
    
    init() {
        let token = ShareViewModel.getToken()
        self.token = token
        self.config = TokenConfiguration(token)
        
        Octokit(config).me() { response in
          switch response {
          case .success(let user):
            print(user.login as Any)
          case .failure(let error):
            print(error)
          }
        }
        
        loadRepo()
    }
    
    func loadRepo() {
        let (owner, name) = ("aheze", "PlaygroundsSyncStorage1") // replace with actual owner and name
        Octokit().repository(owner: owner, name: name) { response in
          switch response {
            case .success(let repository):
              print("Repo: \(repository)")
              let url = repository.gitURL
              print("aa \(url)")
            case .failure(let error):
              print("Failed to load repo: \(error)")
          }
        }
    }
}
