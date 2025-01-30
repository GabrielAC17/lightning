//
//  lightningAppTests.swift
//  lightningAppTests
//
//  Created by Gabriel De Andrade Cordeiro on 30/01/25.
//

import Testing
@testable import lightningApp

struct lightningAppTests {

    @Test func testLightningResponse() async throws {
        let viewModel = ListView.ListViewModel(LightningServiceMock())
        await viewModel.listLightnings()
        
        #expect(viewModel.errorMessage == nil)
        #expect(viewModel.items.count > 0)
        #expect(viewModel.items.first?.alias == "WalletOfSatoshi.com")
    }
    
    @Test func testLightningDateConversion() async throws {
        let viewModel = ListView.ListViewModel(LightningServiceMock())
        await viewModel.listLightnings()
        
        #expect(viewModel.items.first?.firstSeenString == "2020-09-30 01:39:00 +0000")
        #expect(viewModel.items.first?.updatedAtString == "2022-08-29 22:28:36 +0000")
    }
    
    @Test func testLightningLocaleConversion() async throws {
        let viewModel = ListView.ListViewModel(LightningServiceMock())
        await viewModel.listLightnings()
        
        #expect(viewModel.items.first?.cityString == "Vancouver")
        #expect(viewModel.items.first?.countryString == "Canadá")
    }
    
    @Test func testLightningBTCConversion() async throws {
        let viewModel = ListView.ListViewModel(LightningServiceMock())
        await viewModel.listLightnings()
        
        #expect(viewModel.items.first?.bitcoinValue == "154.64503162 BTC")
    }
}
