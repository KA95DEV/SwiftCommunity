//
//  Copyright © 2019 An Tran. All rights reserved.
//

import XCoordinator
import SuperArcCoreUI
import SuperArcCore

class AuthorDetailViewModel: ViewModel {

    // MARK: Properties

    // Public

    // Private

    private var authorMetaData: AuthorMetaData
    private let router: AnyRouter<AuthorsRoute>

    // MARK: Initialization

    init(authorMetaData: AuthorMetaData, router: AnyRouter<AuthorsRoute>, engine: Engine) {
        self.authorMetaData = authorMetaData
        self.router = router
        super.init(engine: engine)
    }
}
