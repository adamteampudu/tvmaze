//
//  ShowsListViewModel.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import Foundation
import RxSwift

final class ShowsListViewModel: BaseViewModel {

    var onSearchTextChangedObservable: Observable<String> {
        onSearchTextChangedSubject
    }

    var reloadViewWithFavoritesPublishObservable: Observable<Bool> {
        reloadViewWithFavoritesPublishSubject
    }

    var goToScenePublishObservable: Observable<ShowsCoordinator.GoToScene> {
        goToSceneSubject
    }

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

    private let reloadViewWithFavoritesPublishSubject = PublishSubject<Bool>()
    private let goToSceneSubject = PublishSubject<ShowsCoordinator.GoToScene>()
    private let onSearchTextChangedSubject = PublishSubject<String>()
    private var shows: [UiShow] = []
    private var favorites: [Int] = []
    private(set) var showFavorites = false
    private var currentSearchTerm: String?

    private let getShowsUseCase: GetShowsUseCase.Alias
    private let getFavoritesUseCase: GetFavoritesUseCase.Alias
    private let updateShowAsFavoriteUseCase: UpdateShowAsFavoriteUseCase.Alias

    init(
        getShowsUseCase: GetShowsUseCase.Alias,
        getFavoritesUseCase: GetFavoritesUseCase.Alias,
        updateShowAsFavoriteUseCase: UpdateShowAsFavoriteUseCase.Alias
    ) {
        self.getShowsUseCase = getShowsUseCase
        self.getFavoritesUseCase = getFavoritesUseCase
        self.updateShowAsFavoriteUseCase = updateShowAsFavoriteUseCase
    }

    func onViewDidLoad() {
        updateFavorites()
        getShows()
    }

    func onViewWillAppear() {
        updateFavorites()
    }

    private func getShows() {
        isLoadingSubject.onNext(true)
        getShowsUseCase.execute(()) { [weak self] getMoviesResult in
            guard let self = self else { return }
            self.isLoadingSubject.onNext(false)
            switch getMoviesResult {
            case .success(data: let moviesList):
                self.shows = moviesList
                self.filterFavorites()
            case .error(error: let errorType):
                self.onError(errorType)
            }
        }
    }

    private func filterFavorites() {
        shows = shows.map({ show in
            var nShow = show
            nShow.isFavorite = favorites.contains(show.id)
            return nShow
        })
        reloadViewWithFavoritesPublishSubject.onNext(showFavorites)
    }

    private func updateFavorites() {
        switch getFavoritesUseCase.execute(()) {
        case .success(data: let currentFavorites):
            favorites = currentFavorites
        default:
            favorites = []
        }
        filterFavorites()
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
        self.reloadViewWithFavoritesPublishSubject.onNext(showFavorites)
    }

    func onShowAll() {
        showFavorites = false
        reloadViewWithFavoritesPublishSubject.onNext(showFavorites)
    }

    func onShowFavorites() {
        showFavorites = true
        reloadViewWithFavoritesPublishSubject.onNext(showFavorites)
    }

    func onUpdateShowIdAsFavorite(atRow row: Int) {
        let show = filteredShows[row]
        _ = updateShowAsFavoriteUseCase.execute(
            UpdateShowAsFavoriteEntity(
            showId: show.id,
                favorite: !show.isFavorite)
        )
        updateFavorites()
    }
}
