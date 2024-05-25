//
//  MeowleTabBarPage.swift
//  meowleUITests

private extension String {
	static let settingsTabBarItem = "settingsTabBarItem"
}

final class MeowleTabBarPage: BasePage {
	
	// MARK: - Elements
	
	private lazy var settingsTabBarItem = app.buttons[.settingsTabBarItem]
	
	// MARK: - Actions
	
	@discardableResult
	func tapSettingsBarItem() -> MeowleTabBarPage {
		settingsTabBarItem.tap()
		return self
	}
}
