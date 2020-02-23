//
//  Endpoint.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 10/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import SwiftHash

class Endpoint {
    private let basePath = "https://gateway.marvel.com:443/v1/public/"
    private let publicKey = "c4d937ea79bb222dd20310db8e5ab83c"
    private let privateKey = "823484589a8ece6a7c4d611f1819c1d5f279df1f"
    
    func createEndpoint(parameters: String) -> String {
        let url = basePath + parameters + getCredentials()
        return url
    }
    
    func heroDetailEndpoint(parameters: String) -> String {
        let url = basePath + parameters + apiKey()
        return url
    }
    
    private func getCredentials() -> String {
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(ts+privateKey+publicKey).lowercased()
        return "ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
    }
    
    private func apiKey() -> String {
        return "apikey=\(publicKey)"
    }
    
}
