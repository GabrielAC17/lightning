//
//  LightningServiceMock.swift
//  lightningApp
//
//  Created by Gabriel De Andrade Cordeiro on 30/01/25.
//

import Foundation


class LightningServiceMock: LightningServiceProtocol {
    func listLightnings() async throws -> [LightningModel] {
        if let data = JsonMock.mockLightning() {
            return [data]
        }
        
        return []
    }
}
