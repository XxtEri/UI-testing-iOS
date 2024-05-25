//
//  MeowleSearchCatUITests.swift
//  meowleUITests
//
//  Created by a.gorshchak on 09.04.2024.
//

import XCTest

private extension MeowleSearchCatUITests {
	enum MockData {
		static let mockCatNames = ["Кот №1", "Кот №2", "Кот №3"]
	}
}

final class MeowleSearchCatUITests: BasePage {
    
    // MARK: - Tests
    
	func testSuccessGetAllCatNames() {
		let searchCatPage = MeowleSearchCatPage()
		setNetworkStub(for: "cats/all",
					   jsonFilename: "core_cats_allByLetter")
		
		openApp(isAuthorised: true)
		
		searchCatPage.tapAllNamesButton()
		MockData.mockCatNames.enumerated().forEach { index, _ in
			searchCatPage.assertExistanceNameOf(cat: MockData.mockCatNames[index])
		}
	}
}
