//
//  ShowsListViewModel.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import Foundation
import RxSwift

final class ShowsListViewModel: BaseViewModel {

    var reloadViewWithFavoritesPublishObservable: Observable<Bool> {
        reloadViewWithFavotiresPublishSubject
    }

    var goToScenePublishObservable: Observable<ShowsCoordinator.GoToScene> {
        goToSceneSubject
    }

    private let reloadViewWithFavotiresPublishSubject = PublishSubject<Bool>()
    private let goToSceneSubject = PublishSubject<ShowsCoordinator.GoToScene>()
    private var shows: [UiShow] = []
    private var favorites: [Int] = []
    private var showFavorites = false
    private var currentSearchTerm: String?

    var filteredShows: [UiShow] {
        let showsToFilter = !showFavorites ? shows : shows.filter { $0.isFavorite == true }
        if let searchText = currentSearchTerm, !searchText.isEmpty {
            return showsToFilter.filter({ show in
                show.name.lowercased().contains(searchText.lowercased())
            })
        } else {
            return showsToFilter
        }
    }

    private let getShowsUseCase: GetShowsUseCase.Alias
    private let getFavoritesUseCase: GetFavoritesUseCase.Alias

    init(
        getShowsUseCase: GetShowsUseCase.Alias,
        getFavoritesUseCase: GetFavoritesUseCase.Alias
    ) {
        self.getShowsUseCase = getShowsUseCase
        self.getFavoritesUseCase = getFavoritesUseCase
    }

    func onViewDidLoad() {
        getFavorites()
        getShows()
    }

    func onViewWillAppear() {
        getFavorites()
    }

    private func getShows() {
        isLoadingSubject.onNext(true)
        getShowsUseCase.execute(()) { [weak self] getMoviesResult in
            guard let self = self else { return }
            self.isLoadingSubject.onNext(false)
            switch getMoviesResult {
            case .success(data: let moviesList):
                self.shows = moviesList
                self.updateFavorites()
            case .error(error: let errorType):
                self.onError(errorType)
            }
        }
    }

    private func updateFavorites() {
        shows = shows.map({ show in
            var nShow = show
            nShow.isFavorite = favorites.contains(show.id)
            return nShow
        })
        reloadViewWithFavotiresPublishSubject.onNext(showFavorites)
    }

    private func getFavorites() {
        switch getFavoritesUseCase.execute(()) {
        case .success(data: let currentFavorites):
            favorites = currentFavorites
        default:
            favorites = []
        }
        updateFavorites()
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

    func onFilterResults(text: String?) {
        currentSearchTerm = text
        self.reloadViewWithFavotiresPublishSubject.onNext(showFavorites)
    }

    func onShowAll() {
        showFavorites = false
        reloadViewWithFavotiresPublishSubject.onNext(showFavorites)
    }

    func onShowFavorites() {
        showFavorites = true
        reloadViewWithFavotiresPublishSubject.onNext(showFavorites)
    }

}
