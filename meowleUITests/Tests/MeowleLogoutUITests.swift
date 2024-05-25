//
//  MeowleLogoutUITests.swift
//  meowleUITests

final class MeowleLogoutUITests: BasePage {

    // MARK: Tests
	
	func testSuccessLogout() {
		openApp(isAuthorised: true)
		
		MeowleSearchCatPage()
			.assertSearchScreenIsOpened()
		
		MeowleTabBarPage()
			.tapSettingsBarItem()
		
		MeowleSettingsPage()
			.assertSettingsScreenIsOpened()
			.tapLogoutFromAppButton()
		
		MeowleAuthPage()
			.assertAuthScreenIsOpened()
	}
}
