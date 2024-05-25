//
//  MeowleSettingsPage.swift
//  meowleUITests

import XCTest

private extension String {
	static let settingsScreenIdentitfier = "settingsScreenViewController"
	static let logoutFromApp = "logOutFromApplication"
}

final class MeowleSettingsPage: BasePage {
	
	// MARK: - Elements
	
	private lazy var settingsScreen = app.otherElements[.settingsScreenIdentitfier]
	private lazy var logoutFromAppButton = app.buttons[.logoutFromApp]
	
	// MARK: - Actions
	
	@discardableResult
	func tapLogoutFromAppButton() -> MeowleSettingsPage {
		logoutFromAppButton.tap()
		return self
	}
	
	// MARK: - Asserts
	
	@discardableResult
	func assertSettingsScreenIsOpened() -> MeowleSettingsPage {
		XCTAssertTrue(settingsScreen.waitForExistence(timeout: .timeout))
		return self
	}
}
