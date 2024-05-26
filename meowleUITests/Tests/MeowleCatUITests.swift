//
//  MeowleCatUITests.swift
//  meowleUITests
//

private extension String {
	static let catNameBaton = "Батон"
}

final class MeowleCatUITests: BasePage {

	// MARK: Tests
	
	func testSuccessLikeCat() {
		openApp(isAuthorised: true)
		
		setNetworkStub(for: "cats/search",
					   jsonFilename: "core_cats_search")
		
		MeowleSearchCatPage()
			.assertSearchScreenIsOpened()
			.tapSearchField()
			.typeTextToSearchTextField(.catNameBaton)
			.tapSearchButton()
			.assertExistanceNameOf(cat: .catNameBaton)
			.tapCat(name: .catNameBaton)
			.tapLikeCatButton()
			.assertIncreasedCatLikes()
	}
}
