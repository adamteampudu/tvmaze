//
//  TVSeriesListViewModel.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import Foundation
import RxSwift

final class TVSeriesListViewModel: BaseViewModel {

    private(set) var tvSeries: [UiShow] = []

    private let reloadTVSeriesPublishSubject = PublishSubject<Void?>()

    private let getTVSeriesUseCase: GetShowsUseCase.Alias

    init(getTVSeriesUseCase: GetShowsUseCase.Alias) {
        self.getTVSeriesUseCase = getTVSeriesUseCase
    }

    var reloadTVSeriesPublishObservable: Observable<Void?> {
        reloadTVSeriesPublishSubject
    }

    func onViewDidLoad() {
        isLoadingSubject.onNext(true)
        getTVSeriesUseCase.execute(()) { [weak self] getMoviesResult in
            guard let self = self else { return }
            self.isLoadingSubject.onNext(false)
            switch getMoviesResult {
            case .success(data: let moviesList):
                self.tvSeries = moviesList
                self.reloadTVSeriesPublishSubject.onNext(())
            case .error(error: let errorType):
                self.onError(errorType)
            }
        }
    }

    func onSelection(row: Int) {
        debugPrint(tvSeries[row])
    }
}
