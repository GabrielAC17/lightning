import Foundation

struct LightningModel: Codable, Identifiable {
    var id = UUID()
    
    let publicKey, alias: String?
    let channels, capacity, firstSeen, updatedAt: Int?
    let city: Locale?
    let country: Locale?
    
    var bitcoinValue: String {
        get {
            guard let capacity = capacity else { return "0" }
            let bitcoinValue = Double(capacity) / 100_000_000
            
            return "\(bitcoinValue) BTC"
        }
    }
    
    var firstSeenString: String {
        get {
            guard let firstSeen = firstSeen else { return "" }
            return Date(timeIntervalSince1970: TimeInterval(firstSeen)).description
        }
    }
    
    var updatedAtString: String {
        get {
            guard let updatedAt = updatedAt else { return "" }
            return Date(timeIntervalSince1970: TimeInterval(updatedAt)).description
        }
    }
    
    var cityString: String {
        get {
            if let city = city?.ptBR { return city }
            else if let cityen = city?.en { return cityen }
            else { return "" }
        }
    }
    
    var countryString: String {
        get {
            if let country = country?.ptBR { return country }
            else if let countryen = city?.en { return countryen }
            else { return "" }
        }
    }
    
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
