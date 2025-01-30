//
//  JsonMock.swift
//  TVMaze
//
//  Created by Gabriel De Andrade Cordeiro on 12/01/25.
//

import Foundation

class JsonMock {
    public static func mockLightning() -> LightningModel? {
        if let url = Bundle.main.url(forResource: "MockLightning", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(LightningModel.self, from: data)
                return jsonData
            } catch let error {
                print("error decoding mock:\(error)")
            }
        }
        return nil
    }
}
