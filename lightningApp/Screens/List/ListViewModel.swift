import Foundation
import SwiftData
import SwiftUI

extension ListView {
    @Observable
    class ListViewModel {
        public var items: [LightningModel] = []
        public var errorMessage: String?
        public var isLoading: Bool = false
        
        
        init() {
            Task {
                await self.listLightnings()
            }
        }
        
        func listLightnings() async {
            self.isLoading = true
            do {
                defer { self.isLoading = false }
                self.errorMessage = nil
                let result = try await LightningService().listLightnings()
                self.items = result
            } catch let error {
                self.errorMessage = ApiError.getErrorMessage(from: error)
            }
        }
    }
}

