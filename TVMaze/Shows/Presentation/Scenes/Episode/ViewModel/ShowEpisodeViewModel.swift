//
//  ShowEpisodeViewModel.swift
//  TVMaze
//
//  Created by Adam Teale on 07-08-21.
//

import Foundation
import RxSwift

final class ShowEpisodeViewModel: BaseViewModel {

    private let args: ShowEpisodeViewArgs

    private var episode: UiEpisode {
        args.episode
    }

    init(args: ShowEpisodeViewArgs) {
        self.args = args
    }

    private let argsPublishSubject = PublishSubject<ShowEpisodeViewArgs>()
    var argsObservable: Observable<ShowEpisodeViewArgs> {
        argsPublishSubject
    }

    func onViewDidLoad() {
        argsPublishSubject.onNext(args)
    }

}
