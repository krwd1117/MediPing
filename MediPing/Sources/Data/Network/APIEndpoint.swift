import Foundation
import MediPingCore

enum APIEndpoint {
    case initialize
}

extension APIEndpoint: Endpoint {
    var path: String {
        switch self {
        case .initialize:
            return "/v1/initialize"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .initialize:
            return .get
        }
    }
} 