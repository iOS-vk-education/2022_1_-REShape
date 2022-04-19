//
//  WaterScreenContainer.swift
//  reshape
//
//  Created by Полина Константинова on 16.04.2022.
//  
//

import UIKit

final class WaterScreenContainer {
    let input: WaterScreenModuleInput
	let viewController: UIViewController
	private(set) weak var router: WaterScreenRouterInput!

	static func assemble(with context: WaterScreenContext) -> WaterScreenContainer {
        let router = WaterScreenRouter()
        let interactor = WaterScreenInteractor()
        let presenter = WaterScreenPresenter(router: router, interactor: interactor)
		let viewController = WaterScreenViewController(output: presenter)

//		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter

        return WaterScreenContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: WaterScreenModuleInput, router: WaterScreenRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct WaterScreenContext {
	weak var moduleOutput: WaterScreenModuleOutput?
    let window: UIWindow
}
