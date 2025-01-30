import Foundation

struct LightningModel: Codable, Identifiable {
    var id = UUID()
    
    let publicKey, alias: String?
    let channels, capacity, firstSeen, updatedAt: Int?
    let city: Locale?
    let country: Locale?
    
    enum CodingKeys: String, CodingKey {
        case publicKey
        case alias
        case channels
        case capacity
        case firstSeen
        case updatedAt
        case city
        case country
    }
}

struct Locale: Codable {
    let de, en, es, fr: String?
    let ja, ptBR, ru, zhCN: String?

    enum CodingKeys: String, CodingKey {
        case de, en, es, fr, ja
        case ptBR = "pt-BR"
        case ru
        case zhCN = "zh-CN"
    }
}
