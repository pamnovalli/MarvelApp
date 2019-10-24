//
//  MarvelApi.swift
//  MarvelApp
//
//  Created by felipecardoso on 05/07/19.
//  Copyright © 2019 Pamela Ianovalli. All rights reserved.
//

import Foundation
import SwiftHash
import Alamofire

public class MarvelApi {

     private let basePath = "https://gateway.marvel.com/v1/public/characters?"
     private let publicKey = "c4d937ea79bb222dd20310db8e5ab83c"
     private let privateKey = "823484589a8ece6a7c4d611f1819c1d5f279df1f"
     private let limit = 50

     func loadHeroes(page: Int = 0, onComplete: @escaping (CharacterInfo?) -> Void) {
        let offset = page * limit

        let url = basePath + "offset=\(offset)&limit=\(limit)&" + getCredentials()
        AF.request(url).responseJSON { (response) in
            print(response)
            guard let data = response.data,
                let marvelResponse = try? JSONDecoder().decode(CharacterInfo.self, from: data),
                marvelResponse.code == 200
                else {
                    onComplete(nil)
                return
            }
            onComplete(marvelResponse)
        }
    }

    private func getCredentials() -> String {
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(ts+privateKey+publicKey).lowercased()
        return "ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
    }
}
