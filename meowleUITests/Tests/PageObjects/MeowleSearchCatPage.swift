//
//  MeowleSearchCatPage.swift
//  meowleUITests
//
//  Created by a.gorshchak on 09.04.2024.
//

import XCTest

private extension String {
	enum Identifier {
		static let searchButtonIdentitfier = "searchCatButton"
		static let mainScreenIdentifier = "searchScreenViewController"
		static let likeCatIdentifier = "likeCatButton"
	}
	
    static let nameOfCat = "Введите имя котика"
	static let allNames = "Все имена"
}

final class MeowleSearchCatPage: BasePage {
    
    // MARK: - Elements
    
    private lazy var searchField = app.textFields[.nameOfCat]
	private lazy var searchButton = app.buttons[.Identifier.searchButtonIdentitfier]
	private lazy var likeCatButton = app.buttons[.Identifier.likeCatIdentifier]
	private lazy var mainScreenTitle = app.otherElements[.Identifier.mainScreenIdentifier]
	private lazy var allNamesButton = app.buttons[.allNames]
	
	private lazy var oldCatLikesCount = 0
    
    // MARK: - Actions
    
    @discardableResult
    func tapSearchField() -> MeowleSearchCatPage {
        searchField.tap()
        return self
    }
    
    @discardableResult
    func typeTextToSearchTextField(_ textField: String) -> MeowleSearchCatPage {
        searchField.typeText(textField)
        return self
    }
    
    @discardableResult
    func tapSearchButton() -> MeowleSearchCatPage {
        searchButton.tap()
        return self
    }
    
    // Тап по названию котика в поисковой выдаче
    @discardableResult
    func tapCat(name: String) -> MeowleSearchCatPage {
        app.staticTexts[name].tap()
        return self
    }
	
	// Тап по кнопке лайка на экране котика
	@discardableResult
	func tapLikeCatButton() -> MeowleSearchCatPage {
		saveOldCatLikesCount()
		likeCatButton.tap()
		return self
	}
	
	@discardableResult
	func tapAllNamesButton() -> MeowleSearchCatPage {
		allNamesButton.tap()
		return self
	}
    
    // MARK: - Asserts
    
    @discardableResult
    func assertExistanceNameOf(cat: String) -> MeowleSearchCatPage {
        XCTAssertTrue(app.staticTexts[cat].waitForExistence(timeout: .timeout))
        return self
    }
    
    @discardableResult
    func assertSearchScreenIsOpened() -> MeowleSearchCatPage {
        XCTAssertTrue(mainScreenTitle.waitForExistence(timeout: .timeout))
        return self
    }
	
	@discardableResult
	func assertIncreasedCatLikes() -> MeowleSearchCatPage {
		let currentLikesCount = likeCatButton.staticTexts.element.label.matches(for: "[0-9]").first
		XCTAssertEqual("\(oldCatLikesCount + 1)", currentLikesCount)
		return self
	}
}

private extension MeowleSearchCatPage {
	func saveOldCatLikesCount() {
		let text = likeCatButton.staticTexts.element.label.matches(for: "[0-9]").first
		if let text = text, let currentLikesCount = Int(text) {
			oldCatLikesCount = currentLikesCount
		}
	}
}
