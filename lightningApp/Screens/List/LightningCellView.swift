import SwiftUI

struct LightningCellView: View {
    @State private var data: LightningModel
    
    init(_ data: LightningModel) {
        self.data = data
    }

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(data.alias ?? "").font(.headline)
                Text("PK: \(data.publicKey ?? "")").font(.subheadline)
                Text("Channels: \(String(data.channels ?? 0))").font(.subheadline)
                Text("Capacity: \(data.bitcoinValue)").font(.subheadline)
                Text("First Seen: \(data.firstSeenString)").font(.subheadline)
                Text("Updated at: \(data.updatedAtString)").font(.subheadline)
                Text("City: \(data.cityString)").font(.subheadline)
                Text("Country: \(data.countryString)").font(.subheadline)
            }
        }
    }
}

#Preview {
    if let mockData = JsonMock.mockLightning() {
        LightningCellView(mockData)
    }
}


