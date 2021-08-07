//
//  ShowsListViewModel.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import Foundation
import RxSwift

final class ShowsListViewModel: BaseViewModel {

    var reloadViewPublishObservable: Observable<Void?> {
        reloadViewPublishSubject
    }

    var goToScenePublishObservable: Observable<ShowsCoordinator.GoToScene> {
        goToSceneSubject
    }

    var currentSearchTerm: String?

    private let reloadViewPublishSubject = PublishSubject<Void?>()
    private let goToSceneSubject = PublishSubject<ShowsCoordinator.GoToScene>()

    private var shows: [UiShow] = []

    var filteredShows: [UiShow] {
        if let searchText = currentSearchTerm, !searchText.isEmpty {
            return shows.filter({ show in
                show.name.contains(searchText)
            })
        } else {
            return shows
        }
    }

    private let getShowsUseCase: GetShowsUseCase.Alias

    init(getShowsUseCase: GetShowsUseCase.Alias) {
        self.getShowsUseCase = getShowsUseCase
    }

    func onViewDidLoad() {
        isLoadingSubject.onNext(true)
        getShowsUseCase.execute(()) { [weak self] getMoviesResult in
            guard let self = self else { return }
            self.isLoadingSubject.onNext(false)
            switch getMoviesResult {
            case .success(data: let moviesList):
                self.shows = moviesList
                self.reloadViewPublishSubject.onNext(())
            case .error(error: let errorType):
                self.onError(errorType)
            }
        }
    }

    func onSelection(row: Int) {
        goToSceneSubject.onNext(
            .pushToShowDetail(
                ShowDetailViewArgs(
                    show: filteredShows[row]
                )
            )
        )
    }

    func filterResults(text: String?) {
        currentSearchTerm = text
        self.reloadViewPublishSubject.onNext(())
    }
}
