//
//  MeowleAuthUITests.swift
//  meowleUITests

private extension String {
	static let userName = "Петя"
}

final class MeowleAuthUITests: BasePage {

    // MARK: - Tests
	
	func testSuccessAuth() {
		openApp(isAuthorised: false)
		
		MeowleAuthPage()
			.tapTextField()
			.typeTextTo(textField: .userName)
			.tapAuthButton()
		
		MeowleSearchCatPage()
			.assertSearchScreenIsOpened()
	}
}
