import Foundation

protocol LightningServiceProtocol {
    func listLightnings() async throws -> [LightningModel]
}

class LightningService: LightningServiceProtocol {
    func listLightnings() async throws -> [LightningModel] {
        let finalString = Config.lightningURL
        guard let url = URL(string: finalString) else {
            throw ApiError.invalidUrl
        }

        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        if try ApiError.isValidResponse(response: response) {
            let data = try JSONDecoder().decode([LightningModel].self, from: data)
            return data
        } else {
            throw ApiError.badRequest
        }
    }
}
