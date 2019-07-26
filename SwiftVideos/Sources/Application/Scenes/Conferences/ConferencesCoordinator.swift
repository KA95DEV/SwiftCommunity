//
//  Copyright © 2019 An Tran. All rights reserved.
//

import XCoordinator
import SuperArcCoreUI
import SuperArcCore
import RxSwift

class ConferencesCoordinator: NavigationCoordinator<ConferencesRoute> {

    // MARK: Properties

    // Private

    private var viewControllerContext: ViewControllerContext

    // MARK: Initialization

    init(viewControllerContext: ViewControllerContext) {
        self.viewControllerContext = viewControllerContext
        super.init(initialRoute: .conferences)
    }

    // MARK: Overrides

    override func prepareTransition(for route: ConferencesRoute) -> NavigationTransition {
        switch route {
        case .conferences:
            let viewController = ConferencesCollectionViewController.instantiate()
            let viewModel = ConferencesCollectionViewModel(router: anyRouter, engine: viewControllerContext.engine)
            viewController.storedViewModel = viewModel
            return .push(viewController)

        case .conferenceDetail(let conferenceMetaData):
            let viewController = ConferenceDetailViewController.instantiate()
            let viewModel = ConferenceDetailViewModel(conferenceMetaData: conferenceMetaData, router: anyRouter, engine: viewControllerContext.engine)
            viewController.storedViewModel = viewModel
            return .push(viewController)

        case .close:
            return .dismissToRoot()
        }
    }

}

public enum ConferencesRoute: Route {
    case conferences
    case conferenceDetail(ConferenceMetaData)
    case close
}
