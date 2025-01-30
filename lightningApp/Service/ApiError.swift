import Foundation

enum ApiError: Error, LocalizedError {
    case invalidUrl
    case invalidParameters
    case tooManyRequests
    case badRequest
    case notFound
    
    static func isValidResponse(response: URLResponse) throws -> Bool {
        guard let httpResponse = response as? HTTPURLResponse else {
            return true
        }
        
        print("API Response status: \(httpResponse.statusCode)")
        switch httpResponse.statusCode {
        case 200..<300:
            return true
        case 429:
            throw ApiError.tooManyRequests
        case 404:
            throw ApiError.notFound
        default:
            throw ApiError.badRequest
        }
    }
    
    static func getErrorMessage(from error: Error) -> String {
        if let apiError = error as? ApiError {
            switch apiError {
            case .badRequest:
                return NSLocalizedString("bad_request_message", comment: "")
            case .invalidParameters:
                return NSLocalizedString("invalid_search", comment: "")
            case .invalidUrl:
                return NSLocalizedString("invalid_url", comment: "")
            case .tooManyRequests:
                return NSLocalizedString("too_many_requests", comment: "")
            case .notFound:
                return NSLocalizedString("not_found", comment: "")
            }
        } else {
            print(error)
            return NSLocalizedString("generic_error", comment: "")
        }
    }
}
