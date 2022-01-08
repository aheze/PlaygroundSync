//
//  ShareViewModel+Token.swift
//  PlaygroundSync
//
//  Created by A. Zheng (github.com/aheze) on 1/8/22.
//  Copyright © 2022 A. Zheng. All rights reserved.
//
    

import Foundation

extension ShareViewModel {
    static func getToken() -> String {
        if let tokenURL = Bundle.main.url(forResource: "Token", withExtension: "") {
            do {
                var token = try String(contentsOf: tokenURL, encoding: .utf8)
                token = token.trimmingCharacters(in: .whitespacesAndNewlines)
                return token
            } catch {
                print("Error getting token: \(error)")
            }
        }
        
        print("Add a `Token` file with your GitHub token inside the `PlaygroundSyncShare` folder.")
        return ""
    }
}
