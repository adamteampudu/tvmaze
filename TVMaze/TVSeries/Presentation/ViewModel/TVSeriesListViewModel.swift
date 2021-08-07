//
//  TVSeriesListViewModel.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import Foundation
import RxSwift

final class TVSeriesListViewModel: BaseViewModel {

    var reloadTVSeriesPublishObservable: Observable<Void?> {
        reloadTVSeriesPublishSubject
    }

    var currentSearchTerm: String?

    private let reloadTVSeriesPublishSubject = PublishSubject<Void?>()

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

    private let getTVSeriesUseCase: GetShowsUseCase.Alias

    init(getTVSeriesUseCase: GetShowsUseCase.Alias) {
        self.getTVSeriesUseCase = getTVSeriesUseCase
    }

    func onViewDidLoad() {
        isLoadingSubject.onNext(true)
        getTVSeriesUseCase.execute(()) { [weak self] getMoviesResult in
            guard let self = self else { return }
            self.isLoadingSubject.onNext(false)
            switch getMoviesResult {
            case .success(data: let moviesList):
                self.shows = moviesList
                self.reloadTVSeriesPublishSubject.onNext(())
            case .error(error: let errorType):
                self.onError(errorType)
            }
        }
    }

    func onSelection(row: Int) {
        debugPrint(shows[row])
    }

    func filterResults(text: String?) {
        currentSearchTerm = text
        self.reloadTVSeriesPublishSubject.onNext(())
    }
}
