import Foundation

public protocol AppStateInterface: ObservableObject {
    var isInitialized: Bool { get set }
} 