import Foundation
import SwiftData
import SwiftUI

extension ListView {
    @Observable
    class ListViewModel {
        public var items: [LightningModel] = []
        public var errorMessage: String?
        public var isLoading: Bool = false
        
        private var service: LightningServiceProtocol
        
        init(_ service: LightningServiceProtocol = LightningService()) {
            self.service = service
            Task {
                await self.listLightnings()
            }
        }
        
        func listLightnings() async {
            self.isLoading = true
            do {
                defer { self.isLoading = false }
                self.errorMessage = nil
                let result = try await self.service.listLightnings()
                self.items = result
            } catch let error {
                self.errorMessage = ApiError.getErrorMessage(from: error)
            }
        }
    }
}

