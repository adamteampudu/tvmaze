//
//  ShowDetailViewModel.swift
//  TVMaze
//
//  Created by Adam Teale on 06-08-21.
//

import Foundation
import RxSwift

final class ShowDetailViewModel: BaseViewModel {

    var reloadViewPublishObservable: Observable<Void?> {
        reloadViewPublishSubject
    }

    var goToScenePublishObservable: Observable<ShowsCoordinator.GoToScene> {
        goToSceneSubject
    }

    private let reloadViewPublishSubject = PublishSubject<Void?>()
    private let goToSceneSubject = PublishSubject<ShowsCoordinator.GoToScene>()

    private let args: ShowDetailViewArgs

    private let getSeasonsUseCase: GetSeasonsUseCase.Alias
    var show: UiShow {
        args.show
    }

    var episodesBySeason = [Int: [UiEpisode]]()

    init(getSeasonsUseCase: GetSeasonsUseCase.Alias, args: ShowDetailViewArgs) {
        self.getSeasonsUseCase = getSeasonsUseCase
        self.args = args
    }

    private let argsPublishSubject = PublishSubject<ShowDetailViewArgs>()
    var argsObservable: Observable<ShowDetailViewArgs> {
        argsPublishSubject
    }

    func onViewDidLoad() {
        isLoadingSubject.onNext(true)
        argsPublishSubject.onNext(args)
        getShowSeasons()
    }

    private func getShowSeasons() {
        getSeasonsUseCase.execute(args.show.id) { [weak self] showSeasons in
            guard let self = self else { return }
            switch showSeasons {
            case .success(data: let episodes):
                let grouped = Dictionary(grouping: episodes, by: { $0.season! })
                self.episodesBySeason = grouped
                self.reloadViewPublishSubject.onNext(())
            default:
                debugPrint("adsf")
            }
        }
    }

    func onSelection(indexPath: IndexPath) {
        if let season = episodesBySeason[indexPath.section + 1] {
            goToSceneSubject.onNext(
                .pushToShowEpisode(
                    ShowEpisodeViewArgs(
                        show: show,
                        episode: season[indexPath.row])
                )
            )
        }
    }

}
