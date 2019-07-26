//
//  Copyright © 2019 An Tran. All rights reserved.
//

import SuperArcCore

class AppManager {

    // MARK: Properties

    // Public

    lazy var core: Core = {
        return Core()
    }()

    // Private

    // MARK: Intialization

    init() {

        let gitService = GitService(context: core.engine.serviceContext)
        core.engine.serviceRegistry.register(gitService, for: GitService.self)

        let conferencesContentProvider = FilesystemConferencesContentProvider(rootFolderPath: gitService.baseLocalRepositoryPath)
        let conferencesService = ConferencesService(context: core.engine.serviceContext, contentProvider: conferencesContentProvider)
        core.engine.serviceRegistry.register(conferencesService, for: ConferencesService.self)

        let videosContentProvider = FilesystemVideosContentProvider(rootFolderPath: gitService.baseLocalRepositoryPath)
        let videosService = VideosService(context: core.engine.serviceContext, contentProvider: videosContentProvider)
        core.engine.serviceRegistry.register(videosService, for: VideosService.self)

        let authorsContentProvider = FilesystemAuthorsContentProvider(rootFolderPath: gitService.baseLocalRepositoryPath)
        let authorsService = AuthorsService(context: core.engine.serviceContext, contentProvider: authorsContentProvider)
        core.engine.serviceRegistry.register(authorsService, for: AuthorsService.self)
    }
}
