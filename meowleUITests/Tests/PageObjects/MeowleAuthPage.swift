//
//  MeowleAuthPage.swift
//  MeowleUITests

import XCTest

private extension String {
    static let authorizationTextField = "Введите своё имя"
    static let authEnterButton = "Войти"
	static let authScreenIdentifier = "authScreenViewController"
}

final class MeowleAuthPage: BasePage {
    
    // MARK: - Elements
    
    private lazy var fieldText = app.textFields[.authorizationTextField]
    private lazy var authButton = app.buttons[.authEnterButton]
	private lazy var authScreen = app.otherElements[.authScreenIdentifier]
    
    // MARK: - Actions
    
    @discardableResult
    func typeTextTo(textField: String) -> MeowleAuthPage {
        fieldText.typeText(textField)
        return self
    }
    
    @discardableResult
    func tapTextField() -> MeowleAuthPage {
        fieldText.tap()
        return self
    }
    
    @discardableResult
    func tapAuthButton() -> MeowleAuthPage {
        authButton.tap()
        return self
    }
	
	// MARK: - Asserts
	
	@discardableResult
	func assertAuthScreenIsOpened() -> MeowleAuthPage {
		XCTAssertTrue(authScreen.waitForExistence(timeout: .timeout))
		return self
	}
}
