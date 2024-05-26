//
//  BasePage.swift
//  meowleUITests
//
//  Created by a.gorshchak on 17.03.2024.
//

import XCTest
import Swifter
import Foundation
import UIKit

extension TimeInterval {
    static let timeout: TimeInterval = 10
}

private extension String {
    static let authName = "Александр"
}

class BasePage: XCTestCase {
    
    lazy var app = {
        let app = XCUIApplication()
        app.launchEnvironment["UITests"] = "YES"
        return app
    }()
    
    // Private
    private let server = HttpServer()
    private let bundle = Bundle(for: BasePage.self)
    
    // MARK: - XCTestCase
    
    override func setUp() {
        super.setUp()
        ["core_cats_allByLetter",
		 "core_cats_search"].forEach { fileName in
            setNetworkStub(
                for: "/" + fileName.replacingOccurrences(of: "_", with: "/"),
                jsonFilename: fileName
            )
        }
        try? server.start(9080, forceIPv4: true)
    }
    
    override func tearDown() {
        server.stop()
        super.tearDown()
    }
    
    final func setNetworkStub(for endpoint: String, jsonFilename: String) {
        if let path = bundle.path(forResource: jsonFilename, ofType: "json") {
            server[endpoint] = shareFile(path)
        } else {
            assertionFailure("Не удалось найти json файл: \(jsonFilename)")
        }
    }
    
    func openApp(isAuthorised: Bool) {
        app.launch()
        if isAuthorised {
            MeowleAuthPage()
                .tapTextField()
                .typeTextTo (textField: .authName)
                .tapAuthButton()
        }
    }
}
